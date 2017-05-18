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
