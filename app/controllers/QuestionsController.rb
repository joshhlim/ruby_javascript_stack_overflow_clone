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
 erb :'categories/show'
end

# create
post '/questions' do
  puts params
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
