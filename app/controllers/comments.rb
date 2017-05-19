get "/questions/:id/comments/new" do
  @question = Question.find(params[:id])
  erb :'comments/questionnew'
end

post "/questions/:id/comments" do
  Comment.create(body: params[:body], commentable_id: params[:id], commentable_type: "Question")
  redirect "/questions/#{params[:id]}"
end

get "/questions/:id/answers/:answer_id/comments/new" do
  @question = Question.find(params[:id])
  @answer = Answer.find(params[:answer_id])
  erb :'comments/answernew'
end

post "/questions/:id/answers/:answer_id/comments" do
  Comment.create(body: params[:body], commentable_id: params[:answer_id], commentable_type: "Answer")
  redirect "/questions/#{params[:id]}"
end
