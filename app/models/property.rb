class Property < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_many :bookings, dependent: :destroy
	belongs_to :user
	has_many :comments, dependent: :destroy
end
