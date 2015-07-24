require './db/setup'
require './lib/all'
require 'pry'

class Script 
	def intro
		print "Based on the readme, what would you like to do? "
		resp = gets.chomp
		if resp != "exit" 
			if resp.start_with?("add ")
				resp.slice!("add ")
				a = resp.split (", ")
				add a.first, a.last
			elsif resp.start_with?("due ")
				resp.slice!("due ")
				a = resp.split(", ")
				add a.first, a.last
			elsif resp.start_with?("done ")
				resp.slice!("done ")
				done resp
			elsif resp == "todo_list"
				todo_list
			elsif resp == "all_lists"
				all_lists
			elsif resp == "all_items"
				all_items
			elsif resp.start_with?("list ")
				resp.slice!("list ")
				list resp
			# Changed from "next" --ruby keyword
			elsif resp == "upcoming"
				upcoming
			elsif resp.start_with?("search ")
				resp.slice!("search ")
				search resp
			elsif
				# do puts "command not found" end
				intro
			end
		else 
			puts "Have a nice day"
		end
	end

	def add list_name, item
		list = List.where(name: list_name).first_or_create!
		Item.where(list_id: list.id, title: item).first_or_create!
		# Other way
		# i = Item.create.where(list: list, title: item)
		intro
	end

	def due n, time
		i = Item.find_by(id: n).first_or_create!
		i.update(due: time)
		intro
	end

	def done n 
		i = Item.find_by(id: n)
		i.update(check: true)
		intro
	end

	def todo_list
		i = Item.all.where(check: false)
		i.each do |a|
			puts a.to_s
		end
		intro
	end

	def list name
		list = List.find_by(name: name)
		i = list.items.where(check: false)
		i.each do |a|
			puts a.to_s
		end
		intro
	end

	def all_lists
		l = List.all
		l.each do |a|
			puts a.to_s
		end
		intro
	end

	def all_items
		i = Item.order(check: :asc)
		i.each do |a|
			puts a.to_s
		end
		intro
	end

	def upcoming
		if Item.where(check: false).count != 0
			i = Item.where(check: false).sample
			puts i.to_s
		else
			j = Item.where(check: true).sample
			puts j.to_s
		end
		intro
	end

	def search string
		if Item.where(title: string) != []
			i = Item.find_by(title: string)
			puts i.to_s
		else
			puts "No results for #{string}"
		end
		intro
	end	
end

s = Script.new
s.intro


