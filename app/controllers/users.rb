require 'byebug'


post '/homepage' do#log in
	# check user exists?
	user = User.find_by(username: params[:user][:username])
	
	if user.password == params[:user][:password]
	#if user exists

	session[:id] = user.id
	erb :"static/homepage"
	else
		redirect to '/'
	end
end

#log out
post '/' do 
	
session[:id] = nil

	redirect to '/' 
end

get '/' do
	erb :"static/index"
end


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




