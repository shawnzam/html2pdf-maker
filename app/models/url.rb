class Url < ActiveRecord::Base
  attr_accessible :url, :workbook_id, :use
  belongs_to :workbook
end
