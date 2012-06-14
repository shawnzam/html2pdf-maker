class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :url
      t.integer :workbook_id

      t.timestamps
    end
  end
end
