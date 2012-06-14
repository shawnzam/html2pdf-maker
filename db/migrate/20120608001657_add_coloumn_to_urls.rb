class AddColoumnToUrls < ActiveRecord::Migration
  def change
	add_column :urls, :use, :boolean   
  end
end
