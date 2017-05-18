get '/' do
  @categories = Category.all
 erb :'/categories/index'
end


get '/category/:id' do
  @category = Category.find_by(id: params[:id])
  erb :'/categories/show'
end