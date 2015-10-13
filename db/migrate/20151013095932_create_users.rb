class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |t|
			t.string :username, null: false
			t.string :email, null: false
			# t.has_many :bookings
			# t.has_many :comments
			t.timestamps
		end
	end
end
