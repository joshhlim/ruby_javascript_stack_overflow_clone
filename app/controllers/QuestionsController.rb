# index
get '/questions' do

end

# new
get '/questions/new' do

end

# create
get '/questions' do

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
get '/questions/:id' do

end

# delete
get '/questions/:id' do

end
