class RemovePdfFileFromWorkbooks < ActiveRecord::Migration
  def up
  remove_column :workbooks,  :pdf_file
  
  end

  def down
  end
end
