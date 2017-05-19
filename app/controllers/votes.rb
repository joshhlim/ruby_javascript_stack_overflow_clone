post '/questions/:id/vote' do
  question = Question.find(params[:id])
  votes = question.votes.where(user: current_user)
  total_value = votes.sum('value')
  if votes.empty? || total_value <= 0
    votes.create(value: 1, user: current_user)
  else total_value == 1
    votes.create(value: -1, user: current_user)
  end
  redirect "/questions/#{params[:id]}"
end

post '/questions/:id/downvote' do
  question = Question.find(params[:id])
  votes = question.votes.where(user: current_user)
  total_value = votes.sum('value')
  if votes.empty? || total_value >= 0
    votes.create(value: -1, user: current_user)
  else total_value == -1
    votes.create(value: 1, user: current_user)
  end
  redirect "/questions/#{params[:id]}"
end

post '/questions/:id/answers/:answer_id/vote' do
  answer = Answer.find(params[:answer_id])
  votes = answer.votes.where(user: current_user)
  total_value = votes.sum('value')
  if votes.empty? || total_value <= 0
    votes.create(value: 1, user: current_user)
  else total_value == 1
    votes.create(value: -1, user: current_user)
  end
  redirect "/questions/#{params[:id]}/answers"
end

post '/questions/:id/answers/:answer_id/downvote' do
  answer = Answer.find(params[:answer_id])
  votes = answer.votes.where(user: current_user)
  total_value = votes.sum('value')
  if votes.empty? || total_value >= 0
    votes.create(value: -1, user: current_user)
  else total_value == -1
    votes.create(value: 1, user: current_user)
  end
  redirect "/questions/#{params[:id]}/answers"
end
