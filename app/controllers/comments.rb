get "/questions/:id/comments/new" do
  @question = Question.find(params[:id])
  erb :'comments/questionnew'
end

post "/questions/:id/comments" do
  new_comment = Comment.create(body: params[:body], commentable_id: params[:id], commentable_type: "Question")
  if request.xhr?
    erb :'/comments/_answercomment'
  else
    redirect "/questions/#{params[:id]}"
  end
end

get "/questions/:id/answers/:answer_id/comments/new" do
  @question = Question.find(params[:id])
  @answer = Answer.find(params[:answer_id])
  erb :'comments/answernew'
end

post "/questions/:id/answers/:answer_id/comments" do
  new_comment = Comment.create(body: params[:body], commentable_id: params[:answer_id], commentable_type: "Answer")
  if request.xhr?
    "<li>#{new_comment.body}</li>"
  else
    redirect "/questions/#{params[:id]}"
  end
end
