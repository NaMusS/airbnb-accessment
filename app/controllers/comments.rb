get '/comments/new' do#new
	
	erb :"comments/new"
end

post '/comments/create' do#create
	@comment = Comment.create(description: params[:description],user_id: params[:user_id],properties_id: params[:properties_id])
	@user = User.find(@comment.user_id)
	erb :"comments/show"
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
		@comment.update(description: params[:description],user_id: params[:user_id],properties_id: params[:properties_id])
		erb :"comments/show"
	elsif params[:decision] == "Delete"
		@comment.destroy
		erb :"static/index"
	end
end




