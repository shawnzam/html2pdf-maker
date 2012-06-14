class AddDefaultValueToUseAttribute < ActiveRecord::Migration
  def change
  	change_column :urls, :use, :boolean, :default => false
  end
end
