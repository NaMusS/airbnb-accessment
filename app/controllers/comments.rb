get '/properties/:id/comments/new' do#new

	@comment = Comment.find(params[:property_id])
	erb :"comments/new"
end

post 'properties/:id/comments/create' do#create
	@comment = Comment.create(description: params[:description],user_id: params[:user_id],property_id: params[:property_id])
	@user = User.find(@comment.user_id)
	# erb :"comments/show"
	redirect to "/properties/#{@property.id}"
end

get '/comments/:id' do#show
	@comment = Comment.find(params[:id])
	erb :"comments/show"
end

get '/comments/:id/edit' do#edit
	@comment = Comment.find(params[:id])
	erb :"comments/edit"
end

post '/comments/:id' do#update
	@comment = Comment.find(params[:id])
	if params[:decision] == "Edit"
		@comment.update(description: params[:description],user_id: params[:user_id],property_id: params[:property_id])
		erb :"comments/show"
	elsif params[:decision] == "Delete"
		@comment.destroy
		erb :"static/index"
	end
end




