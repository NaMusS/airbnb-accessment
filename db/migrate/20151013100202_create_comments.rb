class CreateComments < ActiveRecord::Migration
	def change
		create_table :comments do |t|
			t.text :text
			t.belongs_to :users
			t.belongs_to :properties
		end
	end
end
