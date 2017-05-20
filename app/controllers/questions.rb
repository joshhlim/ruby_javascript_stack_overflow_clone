get '/questions' do
  all_questions = Question.all
  erb :'questions/index'
end

get '/questions/new' do
  erb :'questions/new'
end

post '/questions' do
  tags = params[:tags].split(", ")
  params[:questioner_id] = session[:id]
  new_question = Question.create(title: params[:title], body: params[:body], questioner_id: session[:id])
  Tag.make_tags(tags, new_question)
  redirect "/questions/#{new_question.id}"
end

get '/questions/:id' do
  question = Question.find(params[:id])
  erb :'questions/show', :locals => {question: question}
end

get '/questions/:id/edit' do
  question = Question.find(params[:id])
  erb :'questions/edit', :locals => {question: question}
end

put '/questions/:id' do
  question = Question.find(params[:id])
  question.update(title: params[:title], body: params[:body])
  redirect "/questions/#{question.id}"
end

delete '/questions/:id' do
  Question.destroy(params[:id])
  redirect "/"
end