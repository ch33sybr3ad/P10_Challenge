get '/' do
  if logged_in?
    current_user
  end
  erb :index
end

get '/home' do
  if logged_in?
    erb :home
  else
    status 404
    return "Not Authorized"
  end
end

post '/signin' do
  user = User.where(username: params[:username]).first
  if user && user.password = params[:password]
    session[:user_id] = user.id
    redirect '/'
  else
    status 404
    return "sorry wrong username and password combination"
  end
end

post '/signup' do
  user = User.create(username: params[:username], password: params[:password])
  session[:user_id] = user.id
  redirect '/'
end

get '/logout' do
  logout
  redirect '/'
end

