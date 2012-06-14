class RemoveColumnsFromWorkbooks < ActiveRecord::Migration
  def up
   remove_column :urls,  :borkmark_file_name
   remove_column :urls,  :borkmark_content_type
   remove_column :urls,  :borkmark_file_size
   remove_column :urls,  :borkmark_updated_at
   end

  def down
  end
end
