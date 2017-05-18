get '/questions/:id/answers' do
  @question = Question.find(:id)
  @answers = @question.answers
  erb :'answers/show'
end

get '/questions/:id/answers/new' do
  @question = Question.find(:id)
  @answer = Answer.find(:answers/:answer_id)
  erb :'answers/show'
end

post '/questions/:id/answers' do
  @question = Question.find(:id)
  @answer = Answer.find(:answers/:answer_id)
  erb :'answers/show'
end

get '/questions/:id/answers/:answer_id' do
  @question = Question.find(:id)
  @answer = Answer.find(:answers/:answer_id)
  erb :'answers/show'
end

get '/questions/:id/answers/:answer_id/edit' do
  @question = Question.find(:id)
  @answer = Answer.find(:answers/:answer_id)
  erb :'answers/edit'
end

put '/questions/:id/answers/:answer_id' do
  @question = Question.find(:id)
  @answer = Answer.find(:answers/:answer_id)
  erb :'answers/show'
end

delete '/questions/:id/answers/:answer_id' do
  @question = Question.find(:id)
  @answer = Answer.find(:answers/:answer_id)
  erb :'answers/show'
end
