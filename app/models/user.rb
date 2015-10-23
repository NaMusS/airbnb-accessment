class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_many :bookings, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :properties, dependent: :destroy

	# def self.authenticate(username, password)
	# 	user = User.find_by username: username
	# 				 	if user.password == password
	# 				 		return user
	# 				 	else
	# 				 		return nil
	# 				 	end
	# end
end

