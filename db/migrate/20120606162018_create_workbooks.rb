class CreateWorkbooks < ActiveRecord::Migration
  def change
    create_table :workbooks do |t|
      t.string :title
      t.string :bookmark_file

      t.timestamps
    end
  end
end
