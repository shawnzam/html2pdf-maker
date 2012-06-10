class UrlsController < ApplicationController
  def index
  end

  def show
  end


  # GET /jobs/new
  # GET /jobs/new.json
  def new
    @url = Url.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @url }
    end
  end

  # GET /jobs/1/edit
  def edit
    @url = Url.find(params[:id])
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @url = Url.new(params[:workbook])
    
    respond_to do |format|
      if @url.save
        format.html { redirect_to @url, :notice => 'Url was successfully created.' }
        format.json { render :json => @url, :status => :created, :location => @url }
      else
        format.html { render :action => "new" }
        format.json { render :json => @url.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
  end

  def delete
  end
end
