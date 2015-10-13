class CreateProperties < ActiveRecord::Migration
	def change
		create_table :properties do |t|
			t.text :location
			t.text :price_per_night
			# t.has_many :bookings
			# t.has_many :comments
			t.timestamps
		end
	end
end
