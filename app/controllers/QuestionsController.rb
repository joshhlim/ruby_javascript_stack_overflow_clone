# index
get '/questions' do

end

# new
get '/questions/new' do
  if session[:id]
    @categories = Category.all
    erb :'questions/new'
  else
    redirect 'users/new'
  end
end

post '/questions/:id/vote' do
 @question = Question.find_by(id: params[:id])
 @category = @question.category
 @vote = Vote.new(voteable_type: Question, voteable_id: params[:id])
 @vote.save
  if request.xhr?
    content_type :json
    {id: @question.id, count: @question.votes.count}.to_json
  else
    erb :'categories/show'
  end
end

# create
post '/questions' do
  @question = Question.create(
    title: params[:question][:title],
    body: params[:question][:body],
    category_id: params[:category],
    user_id: session[:id])
  redirect :"questions/#{@question.id}"
end

# show
get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end

# edit
get '/questions/:id/edit' do

end

# update
put '/questions/:id' do

end

# delete
delete '/questions/:id' do
   question = Question.find_by(id: params[:id])
   question.destroy
   redirect '/'
end

# new answer
get '/questions/:id/answers/new' do
  if session[:id]
    @question = Question.find(params[:id])
    erb :'answers/new'
  else
    redirect '/'
  end
end

# create answer
post '/questions/:id/answers' do
  question = Question.find(params[:id])
  @answer = Answer.create(
    body: params[:answer][:body],
    question_id: question.id,
    user_id: session[:id])
  redirect :"questions/#{params[:id]}"
end

get '/questions/:id/comments/new' do
  if session[:id]
    @question = Question.find(params[:id])
    if request.xhr?
      erb :'questions/new_comment', layout: false
    else
      erb :'questions/new_comment'
    end
  else
    redirect '/'
  end
end

post '/questions/:id/comments' do
  question = Question.find(params[:id])
  @comment = Comment.create(
    body: params[:comment][:body],
    commentable_type: 'Question',
    commentable_id: params[:id],
    user_id: session[:id])
  if request.xhr?
    "<li><%= comment.body %><br><%= comment.user.username%></li>"
  else
    redirect :"questions/#{params[:id]}"
  end
end

get '/answers/:id/comments/new' do
  if session[:id]
    @answer = Answer.find(params[:id])
    erb :'answers/new_comment'
  else
    redirect '/'
  end
end

post '/answers/:id/comments' do
  answer = Answer.find(params[:id])
  @comment = Comment.create(
    body: params[:comment][:body],
    commentable_type: 'Answer',
    commentable_id: params[:id],
    user_id: session[:id])
  redirect :"questions/#{answer.question.id}"
end
