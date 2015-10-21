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
	erb :"bookings/show"
end

get '/bookings/:id/edit' do#edit
	@booking = Booking.find(params[:id])
	erb :"bookings/edit"
end

post '/bookings/:id' do#update
	@booking = Booking.find(params[:id])
	@user = User.find(session[:id])
	if params[:decision] == "Edit"
		@booking.update(checkin: params[:checkin], checkout: params[:checkout],user_id: @user.id,property_id: @property.id)
		erb :"bookings/show"
	elsif params[:decision] == "Delete"
		@booking.destroy
		erb :"static/index"
	end
end




