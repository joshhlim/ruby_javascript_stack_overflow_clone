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

end

# new answer
get '/questions/:id/answers/new' do
  @question = Question.find(params[:id])
  erb :'answers/new'
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
