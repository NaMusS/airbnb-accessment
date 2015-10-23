require 'byebug'

get '/properties/:id/bookings/new' do#new
	@property = Property.find(params[:id])
	# session[:id]
	# @user = User.find(1)	
	erb :"bookings/new"
end

post '/properties/:id/bookings/create' do#create
	@property = Property.find(params[:id])
	@user = User.find(session[:id])
	@booking = Booking.create(checkin: params[:checkin],checkout: params[:checkout],user_id: @user.id,property_id: @property.id)
	#how do i connect to the user?
	redirect to "/properties/#{@property.id}"
	# erb :"bookings/show"
end

get '/bookings/:id' do#show
	@booking = Booking.find(params[:id])
	#experiment below
	erb :"bookings/show"
end

get '/bookings/:id/edit' do#edit
	#do i add @user session here?
	# @user = User.find(session[:id])
	@booking = Booking.find(params[:id])
	erb :"bookings/edit"
end

post '/bookings/:id' do#update
	@property = Property.find(params[:id]) # testing
	byebug
	@booking = Booking.find(params[:id])
	byebug
	@user = User.find(session[:id])
	if params[:decision] == "Edit Your Booking"
		@booking.update(checkin: params[:checkin], checkout: params[:checkout],user_id: @user.id,property_id: @property.id)
		#redirect to user profile experiment
		redirect to "/users/#{@user.id}"
		# erb :"bookings/show"
	elsif params[:decision] == "Delete/Cancel Your Booking"
		@booking.destroy
		#redirect to user profile experiment
		redirect to "/users/#{@user.id}"
		# erb :"static/index"
	end
end




