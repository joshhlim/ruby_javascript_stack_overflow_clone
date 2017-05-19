get '/' do
  @categories = Category.all
 erb :index
end


get '/category/:id' do
  @category = Category.find_by(id: params[:id])
  erb :'/categories/show'
end

get '/search' do
  @query = params[:search].split(' ')



end

post '/search' do
  @questions = Question.all
  @questions.search_question(@query)
  erb :'/results'
end
