require 'byebug'

get '/bookings/new' do#new
	
	erb :"bookings/new"
end

post '/bookings/create' do#create
	@booking = Booking.create(checkin: params[:checkin],checkout: params[:checkout],user_id: params[:user_id],properties_id: params[:properties_id])
	#how do i connect to the user?
	erb :"bookings/show"
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
	if params[:decision] == "Edit"
		@booking.update(checkin: params[:checkin], checkout: params[:checkout],user_id: params[:user_id],properties_id: params[:properties_id])
		erb :"bookings/show"
	elsif params[:decision] == "Delete"
		@booking.destroy
		erb :"static/index"
	end
end




