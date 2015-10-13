class CreateBookings < ActiveRecord::Migration
	def change
		create_table :bookings do |t|
			t.text :text
			t.belongs_to :users
			t.belongs_to :properties
		end
	end
end
