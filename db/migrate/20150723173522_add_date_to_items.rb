class AddDateToItems < ActiveRecord::Migration
  def change
  	add_column :items, :due, :datetime
  end
end
