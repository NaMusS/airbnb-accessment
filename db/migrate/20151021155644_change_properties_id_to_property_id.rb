class ChangePropertiesIdToPropertyId < ActiveRecord::Migration
	def change
		rename_column :bookings, :properties_id, :property_id
		rename_column :comments, :properties_id, :property_id
	end
end
