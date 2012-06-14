class AddColumnsToWorkbook < ActiveRecord::Migration
  def change
    add_column :workbooks, :pdf_file, :string
    
  end
end
