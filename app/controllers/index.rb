get '/' do
  @categories = Category.all
 erb :index
end


get '/search' do
  @query = params[:search].split(' ')
  @questions = Question.all
  @all_questions = @questions.search_question(@query)

  erb :'/results'
end
