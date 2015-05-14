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

get '/favorite' do
  @user = User.where(id: session[:user_id]).first
  find_jobs(@user)
  erb :favorite
end

get '/search' do 
  erb :search
end

get '/searchjob' do
  redirect '/search'
end

post '/searchjob' do
  search = params[:search]
  location = params[:location]
  json_obj = HTTParty.get("http://api.indeed.com/ads/apisearch?publisher=6291780534833421&format=json&q=#{search.gsub(" ", "%20")}&l=#{location.gsub(" ", "%20")}&sort=&radius=&st=&jt=&start=&limit=&fromage=&filter=&latlong=1&co=us&chnl=&userip=1.2.3.4&useragent=Mozilla/%2F4.0%28Firefox%29&v=2")
  job = JSON.parse(json_obj)
  create_jobs_array(job)
  erb :search
end
