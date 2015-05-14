
get '/favorite' do
  @user = User.where(id: session[:user_id]).first
  find_jobs(@user)
  erb :favorite
end

post '/favoritejob' do
  Relationship.create(users_id: params[:user_id], jobs_id: params[:job_id])
  redirect '/favorite'
end

delete '/favoritejob' do
  relationship = Relationship.where(users_id: params[:user_id], jobs_id: params[:job_id]).first
  relationship.destroy
  redirect '/favorite'
end