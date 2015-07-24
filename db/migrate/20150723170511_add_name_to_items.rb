class AddNameToItems < ActiveRecord::Migration
  def change
  	add_column :items, :title, :string 
  end
end
