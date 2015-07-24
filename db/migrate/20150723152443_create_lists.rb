class CreateLists < ActiveRecord::Migration
    def change
  	create_table "lists" do |t|
  		t.string "name"
  	end

    create_table "items" do |t|
    	t.belongs_to "list", index: true
    	t.string "desc"
    	t.boolean "check"
    end
  end
end
