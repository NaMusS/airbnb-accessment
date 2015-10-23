
get '/properties/new' do#new
	
	erb :"properties/new"
end

post '/properties/create' do#create
	# @user = User.find(@property.user_id)
	@user = User.find(session[:id])
	@property = Property.create(title: params[:title],description: params[:description],price: params[:price],user_id: @user.id)
	#redirect to user profile page to show new property
	redirect to "/users/#{@user.id}"
	# erb :"properties/show"
end

get '/properties/:id' do#show
	@property = Property.find(params[:id])
	@bookings = Booking.where(property_id: @property.id)
	#add comment link here
	@comments = Comment.where(property_id: @property.id)
	# byebug there is a comment object
	erb :"properties/show"
end

get '/properties/:id/edit' do#edit
	@property = Property.find(params[:id])
	erb :"properties/edit"
end

post '/properties/:id' do#update
	@property = Property.find(params[:id])
	@user = User.find(session[:id])
	if params[:decision] == "Edit Property"
		@property.update(title: params[:title],description: params[:description],price: params[:price])
		redirect to "/users/#{@user.id}"
		# erb :"properties/show"
	elsif params[:decision] == "Delete Property"
		@property.destroy
		redirect to "/users/#{@user.id}"
		# erb :"static/index"
	end
end




