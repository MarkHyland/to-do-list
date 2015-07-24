# Have to create the class for it to show up in the
# database.

class List < ActiveRecord::Base
	has_many :items

	def to_s
		"id: #{self.id}, name: #{self.name} \n"
	end
end