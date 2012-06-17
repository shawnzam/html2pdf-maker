class WorkbooksController < ApplicationController
require 'fileutils'
require "pdf/merger"
PDF_ROOT = "temp_pdf"
# def make_workbook(url)
#   url2 = "http://www.apple.com"
#   url2 = "http://www.google.com"
#   kit = PDFKit.new(url1)
#   file = kit.to_file('1.pdf')
#   kit = PDFKit.new(url2)
#   file = kit.to_file('2.pdf')
#   system('pdftk 1.pdf 2.pdf cat output 3.pdf')
# end
  def parse_bookmark_file(filepath)
  	bookmark_file = File.new(filepath, "r", :encoding => "BINARY")
  	contents = bookmark_file.read
  	url_array = contents.scan(/\bhttps?:\/\/\S+\b/)
  	return url_array 
  end
  
  def make_pdf(id, list_of_URL_ids)
	@workbook = Workbook.find(id)
	if !File.directory? "#{PDF_ROOT}"
        Dir.mkdir("#{PDF_ROOT}") #make root dir if it doesn't exist?
    end
    if !File.directory? "#{PDF_ROOT}/#{id}/"
    	Dir.mkdir("#{PDF_ROOT}/#{id}/")
    end
	list_of_URL_ids.each do |url_id|
	     @cur_url = @workbook.urls.find(url_id)
	     kit = PDFKit.new(@cur_url.url, :print_media_type => true)
	     file = kit.to_file("#{PDF_ROOT}/#{id}/#{url_id}.pdf")
    end
    
    files_list = Dir.glob("#{PDF_ROOT}/#{id}/*.pdf")
    pdf = PDF::Merger.new
    for file in files_list
      puts file
      pdf.add_file file
    end
    
    #system("pdftk #{PDF_ROOT}/#{id}/*.pdf cat output #{PDF_ROOT}/#{id}/out.pdf")
    pdf.save_as "#{PDF_ROOT}/#{id}/out.pdf"
    @workbook.pdf = File.open("#{PDF_ROOT}/#{id}/out.pdf")
    @workbook.save!
    FileUtils.rm_rf "#{PDF_ROOT}/#{id}/"
    send_file @workbook.pdf.path, :type=> 'application/pdf'
  end  
  
  def index
	@workbooks = Workbook.all
	respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @workbooks }
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @workbook = Workbook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @workbook }
    end
  end

  # GET /jobs/new
  # GET /jobs/new.json
  def new
    @workbook = Workbook.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @workbook }
    end
  end

  # GET /workbooks/1/edit
  def edit
    @workbook = Workbook.find(params[:id])
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @workbook = Workbook.new(params[:workbook])
    
    respond_to do |format|
      if @workbook.save
      	url_array = parse_bookmark_file(@workbook.bookmark.path)
      	url_array.each do |url|
	    @workbook.urls.build(:url => url, :use => false)
	    @workbook.save
	  end
        format.html { redirect_to @workbook, :notice => 'Workbook was successfully created.' }
        format.json { render :json => @workbook, :status => :created, :location => @workbook }

      else
        format.html { render :action => "new" }
        format.json { render :json => @workbook.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /jobs/1
  # PUT /jobs/1.json
  def update
    @workbook = Workbook.find(params[:id])   

    respond_to do |format|
      if @workbook.update_attributes(params[:job])

        format.html { redirect_to @workbook, :notice => 'Workbook was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @workbook.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @workbook = Workbook.find(params[:id])
    @workbook.destroy

    respond_to do |format|
      format.html { redirect_to jobs_url }
      format.json { head :ok }
    end
  end
  
  def choose
  	Url.update_all(:use => false)
  	@workbook = Workbook.find(params[:workbook_id])
  	Url.update_all({:use => true}, :id => params[:url_ids])
  	make_pdf(@workbook.id, params[:url_ids])
  	
  	#redirect_to :action => "show", :id => @workbook.id
  end
end
