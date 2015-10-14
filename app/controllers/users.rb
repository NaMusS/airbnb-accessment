require 'byebug'

get '/users/new' do
	
	erb :"users/new"
end

post '/users/create' do
	@user = User.create(username: params[:username],password: params[:password])
	erb :"users/show"

end

get '/users/:id' do
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




