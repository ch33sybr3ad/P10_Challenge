get '/' do
  if logged_in?
    current_user
  end
  erb :index
end

post '/signin' do
  user = User.where(username: params[:name]).first
  if user.password = params[:password]
    session[:user_id] = user.id
    redirect '/'
  else
    status 404
    return "sorry wrong username and password combination"
  end
end

post '/signup' do
  user = User.create(params[:user])
  session[:user_id] = user.id
  redirect '/'
end

# maybe add /search/:search ??
get '/search' do 
  erb :search
end

post '/searchcompany' do
  search = params[:search]
  @company = HTTParty.get("http://api.glassdoor.com/api/api.htm?t.p=35408&t.k=ebFf3MTNqwe&userip=0.0.0.0&useragent=&format=json&v=1&action=employers&q=#{search}")
  p @company["response"]["employers"][0]["name"]
  return @company["response"]["employers"][0]["website"]
end

post '/searchjob' do
  search = params[:search]
  json_obj = HTTParty.get("http://api.indeed.com/ads/apisearch?publisher=6291780534833421&format=json&q=#{search}&l=&sort=&radius=&st=&jt=&start=&limit=&fromage=&filter=&latlong=1&co=us&chnl=&userip=1.2.3.4&useragent=Mozilla/%2F4.0%28Firefox%29&v=2")
  job = JSON.parse(json_obj)
  create_jobs_array(job)
  erb :search
end


#API pass in action/parameters/values

# http://api.glassdoor.com/api/api.htm?t.p=35408&t.k=ebFf3MTNqwe&userip=0.0.0.0&useragent=&format=json&v=1&action=employers
# request for Target Co.

# @job = HTTParty.get('http://api.glassdoor.com/api/api.htm?t.p=35408&t.k=ebFf3MTNqwe&userip=0.0.0.0&useragent=&format=json&v=1&action=employers')

# content_type :json
# @job.to json 

# create api env file