
get '/properties/new' do#new
	
	erb :"properties/new"
end

post '/properties/create' do#create
	@property = Property.create(title: params[:title],description: params[:description],price: params[:price],user_id: params[:user_id])
	@user = User.find(@property.user_id)
	erb :"properties/show"
end

get '/properties/:id' do#show
	@property = Property.find(params[:id])
	@bookings = Booking.where(property_id: @property.id)
	erb :"properties/show"
end

get '/properties/:id/edit' do#edit
	@property = Property.find(params[:id])
	erb :"properties/edit"
end

post '/properties/:id' do#update
	@property = Property.find(params[:id])
	if params[:decision] == "Edit Property"
		@property.update(title: params[:title],description: params[:description],price: params[:price])
		erb :"properties/show"
	elsif params[:decision] == "Delete Property"
		@property.destroy
		erb :"static/index"
	end
end




