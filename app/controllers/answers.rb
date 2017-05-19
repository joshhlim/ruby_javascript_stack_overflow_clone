get '/questions/:id/answers' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  erb :'answers/index'
end

get '/questions/:id/answers/new' do
  @question = Question.find(params[:id])
  erb :'answers/new'
end

post '/questions/:id/answers' do
  @question = Question.find(params[:id])
  @answer = Answer.new(params[:answer])
  @answer.assign_attributes(question_id: @question.id, answerer_id: session[:id])
  @answer.save
  if request.xhr?
    erb :'/answers/_show', layout: false, locals: { question: @question, answer: @answer }
  else
    redirect "/questions/#{@question.id}/answers"
  end
end

# don't need to show indiv answer unless editing
# get '/questions/:id/answers/:answer_id' do
#   @question = Question.find(params[:id])
#   @answer = Answer.find(params[:answer_id])
#   erb :'answers/show'
# end

put '/questions/:id/answers/:answer_id/bestanswer' do
  answers = Question.find(params[:id]).answers.all
  Answer.reset_best_answer(answers)
  Answer.find(params[:answer_id]).update_attributes(best_answer: 1)

  if request.xhr?
    "http://clipartix.com/wp-content/uploads/2016/04/Thumbs-up-clipart-2.png"
  else
    redirect "/questions/#{params[:id]}"
  end

end

get '/questions/:id/answers/:answer_id/edit' do
  @question = Question.find(params[:id])
  @answer = Answer.find(params[:answer_id])
  erb :'answers/edit'
end

put '/questions/:id/answers/:answer_id' do
  @question = Question.find(params[:id])
  @answer = Answer.find(params[:answer_id])
  @answer.update_attributes(params[:answer])
  redirect "/questions/#{@question.id}/answers"
end

delete '/questions/:id/answers/:answer_id' do
  @answer = Answer.find(params[:answer_id])
  @answer.destroy
  redirect "/questions/#{params[:id]}/answers"
end
