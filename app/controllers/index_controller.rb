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

#'/info/:search_term
get '/info' do 
  @job = HTTParty.get('http://api.glassdoor.com/api/api.htm?t.p=35408&t.k=ebFf3MTNqwe&userip=0.0.0.0&useragent=&format=json&v=1&action=employers')
  # content_type :json
  @job.to_json
  # puts "######"
  # puts @job["response"]["employers"][2]["name"] #.each { |x| puts x  }
  # puts "######"
  # erb :index
end

get '/searchcompany' do 
  erb :search
end

post '/searchcompany' do
  search = params[:search]
  @job = HTTParty.get("http://api.glassdoor.com/api/api.htm?t.p=35408&t.k=ebFf3MTNqwe&userip=0.0.0.0&useragent=&format=json&v=1&action=employers&q=#{search}")
  p @job["response"]["employers"][0]["name"]
  return @job["response"]["employers"][0]["website"]
end

#API pass in action/parameters/values

# http://api.glassdoor.com/api/api.htm?t.p=35408&t.k=ebFf3MTNqwe&userip=0.0.0.0&useragent=&format=json&v=1&action=employers
# request for Target Co.

# @job = HTTParty.get('http://api.glassdoor.com/api/api.htm?t.p=35408&t.k=ebFf3MTNqwe&userip=0.0.0.0&useragent=&format=json&v=1&action=employers')

# content_type :json
# @job.to json 

# create api env file