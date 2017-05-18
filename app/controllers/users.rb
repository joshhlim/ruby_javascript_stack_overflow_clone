get '/users/new' do
  erb :'users/new'
end

get '/users/:id' do
  new_user = User.find(params[:id])
  erb :'users/profile', :locals => {user: new_user}
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
