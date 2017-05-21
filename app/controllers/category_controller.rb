get '/category/:id' do
  @category = Category.find_by(id: params[:id])
  erb :'/categories/show'
end

delete '/category/:id/question/:question_id' do
  @question = Question.find_by(id: params[:question_id])
  @question.destroy
  if request.xhr?
     content_type :json
     {id: @question.id}.to_json
   else
    erb :'/categories/show'
  end
end
