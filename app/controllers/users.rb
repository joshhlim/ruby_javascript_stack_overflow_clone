get '/users/:id' do 

	erb :'users/login' unless session[:id]
	@user = User.find(params[:id])
	@questions = Question.where(params[:id])
	erb :'users/profile'
end

get '/users/:id/edit' do 
	@user = User.find(params[:id])
	erb :'users/login'
end

put '/users/:id' do 
	@user = User.find(params[:id])
	@user.update_attributes(params[:user])
	@user.password=(params[:user][:password])
	@user.save
	redirect "/users/#{@user.id}"
end

get '/logout' do 
	session.clear
	redirect '/'
end