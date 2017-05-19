require 'sinatra/flash'
before do
  if logged_in?
    @user = User.find(session[:id])
  end
end

get '/questions/new' do
  erb :'/questions/new'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @question.view_count += 1
  @answers = Answer.where(question_id: @question.id)
  erb :'/questions/show'
end

get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  if logged_in? && (@question.user_id == @user.id)
  erb:"/questions/edit"
  else
    flash[:error] = "You don't have rights to edit."
    redirect "/questions/#{@question.id}"
  end
end

post '/questions' do
  question = Question.new(params[:question])
  if @user
    @user.questions << question
    redirect "/users/#{@user.id}/profile"
  else
     "Error"
  end
end

put '/questions/:id' do
  @question = Question.find(params[:id])
  @question.update(params[:question])
  redirect "/questions/#{@question.id}"
end

delete '/questions/:id' do
  @question = Question.find(params[:id])
  if logged_in? && (@question.user_id == @user.id)
    @question.destroy
    redirect "/"
  else
  flash[:error] = "You don't have rights to delete."
  redirect "/questions/#{@question.id}"
  end
end
