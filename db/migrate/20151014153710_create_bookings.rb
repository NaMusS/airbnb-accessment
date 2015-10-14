class CreateBookings < ActiveRecord::Migration
	def change
		create_table :bookings do |t|
			t.date :checkin, null: false
			t.date :checkout, null:false
			t.integer :user_id, null: false
			t.integer :properties_id, null: false
			t.timestamps null: false
		end
	end
end
