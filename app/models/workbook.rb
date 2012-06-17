class Workbook < ActiveRecord::Base
  attr_accessible :string, :title
  attr_accessible :string, :bookmark_file
  attr_accessible :bookmark
  has_attached_file :bookmark
  has_attached_file :pdf

  
  has_many :urls
  accepts_nested_attributes_for :urls 
end
