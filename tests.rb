require './db/setup'
require './lib/all'
require 'minitest/autorun'
require 'pry'

class TestDatabase < Minitest::Test
	def test_database_sync
		Item.destroy_all
		List.destroy_all
		assert_equal 0, Item.count
		Item.create!(list_id: 1, desc: "work")
		assert_equal 1, Item.count
	end

	def test_list_has_items
		Item.destroy_all
		List.destroy_all
		List.create!(id: 3, name: "tomorrow")
		Item.create!(list_id: 3, desc: "play")
		Item.create!(list_id: 3, desc: "rest")
		list = List.last
		# List.where produces an array
		assert_equal 2, list.items.count
	end
end