class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_many :bookings
	has_many :comments
	has_many :properties, :through => :bookings
end
