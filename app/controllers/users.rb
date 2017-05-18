enable :sessions

get '/users/login' do
  @user = User.new
  erb :'users/form'
end

post '/users/login' do
  @user = User.find_by(username: params[:user][:username])
  redirect "/users/#{@user.id}"
end

get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :'users/form'
end

put '/users/:id' do
  @user = User.find(params[:id])
  @user.assign_attributes(params[:user])
  @user.password=(params[:user][:password])
  @user.save
  redirect "/users/#{@user.id}"
end

get '/users/logout' do
  session.clear
  redirect '/'

get '/users/new' do
  erb :'users/new'
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :'users/profile', :locals => {user: @user}
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    puts @errors
    erb :'users/new'
  end

end
