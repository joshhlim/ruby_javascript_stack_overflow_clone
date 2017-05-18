get '/questions' do
  all_questions = Question.all
  erb :'questions/index', :locals => {questions: all_questions}
end

get '/questions/new' do
  erb :'questions/new'
end

post '/questions' do
  params[:questioner_id] = session[:id]
  new_question = Question.create(params)
  redirect "/questions/#{new_question.id}"
end

get '/questions/:id' do
  question = Question.find(params[:id])
  erb :'questions/show', :locals => {question: question}
end

get '/questions/:id/edit' do

end

put '/questions/:id' do

end

delete '/questions/:id' do

end
