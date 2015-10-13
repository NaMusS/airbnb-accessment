class Comment < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :users
	belongs_to :properties
end
