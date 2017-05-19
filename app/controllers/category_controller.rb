get '/category/:id' do
  @category = Category.find_by(id: params[:id])
  erb :'/categories/show'
end

delete '/category/:id' do
  @category = Category.find_by(id: params[:id])
  if request.xhr?
     content_type :json
     {id: @category.id}.to_json
   else
    erb :'/categories/show'
  end
end
