class ChangeDefaults < ActiveRecord::Migration
  change_table :items do |t|
 	t.change :check, :boolean, default: false
	end
end
