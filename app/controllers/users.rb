require 'byebug'

get '/users/new' do#new
	
	erb :"users/new"
end

post '/users/create' do#create
	@user = User.create(username: params[:username],password: params[:password])
	erb :"users/show"

end

get '/users/:id' do#show
	@user = User.find(params[:id])
	erb :"users/show"
end

get '/users/:id/edit' do#edit
	@user = User.find(params[:id])
	erb :"users/edit"
end

post '/users/:id' do#update
	@user = User.find(params[:id])
	if params[:decision] == "Edit"
		@user.update(username: params[:username], password: params[:password])
		erb :"users/show"
	elsif params[:decision] == "Delete"
		@user.destroy
		erb :"static/index"
	end
end




