# Have to create the class for it to show up in the
# database.

class Item < ActiveRecord::Base
	belongs_to :list

	def to_s
		"id:#{self.id}, title:#{self.title}, due:#{self.due}, check:#{self.check}, list_id:#{self.list_id}, desc:#{self.desc} \n"
	end
end
