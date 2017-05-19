get '/users/new' do
  @user = User.new()
  erb :'users/new'
end

#new user post
post '/users' do
  @user = User.create(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = ['You cannot leave a field blank']
    erb :'/users/new'
  end
 end

 get '/users/login' do
   erb :'users/login'
 end

#login user post
 post '/users/login' do
   @user = User.find_by(username: params[:user][:username])
   if @user && @user.authenticate(params[:user][:password])
     session[:id] = @user.id
     redirect "/users/#{@user.id}"
   else
     @errors = ['Username or Password did not match']
     erb :'/users/login'
   end
 end

get '/users/logout' do
   session.clear
   redirect "/"
 end

get '/users/:id' do
  erb :'users/login' unless session[:id]
  @user = User.find(params[:id])
  @questions = @user.questions
  @answers  = @user.answers
  @question_comments = @user.comments.where(commentable_type: "Question")
  @answer_comments = @user.comments.where(commentable_type: "Answer")

  erb :'users/profile'
end


#edit profile get
get 'users/:id/edit' do 
  @user = User.find(params[:id])
  erb :'users/update_user'
end

#update profile post
put 'users/:id' do 
  @user = User.find(params[:id])
  @user.update_attributes(params[:user])
  @user.password
  @user.save

  redirect "/users/#{@user.id}"
end