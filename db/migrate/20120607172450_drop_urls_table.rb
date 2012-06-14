class DropUrlsTable < ActiveRecord::Migration
  def up
  	drop_table :urls
  end

  def down
  end
end
