class RemoveColumnsFromWorkbooks2 < ActiveRecord::Migration
  def up
   remove_column :workbooks,  :borkmark_file_name
   remove_column :workbooks,  :borkmark_content_type
   remove_column :workbooks,  :borkmark_file_size
   remove_column :workbooks,  :borkmark_updated_at
  end

  def down
  end
end
