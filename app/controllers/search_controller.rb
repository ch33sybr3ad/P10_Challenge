get '/search' do 
  erb :search
end

get '/searchjob' do
  redirect '/search'
end

post '/searchjob' do
  @user = User.where(id: session[:user_id]).first
  search = params[:search]
  location = params[:location]
  json_obj = HTTParty.get("http://api.indeed.com/ads/apisearch?publisher=6291780534833421&format=json&q=#{search.gsub(" ", "%20")}&l=#{location.gsub(" ", "%20")}&sort=&radius=&st=&jt=&start=&limit=&fromage=&filter=&latlong=1&co=us&chnl=&userip=1.2.3.4&useragent=Mozilla/%2F4.0%28Firefox%29&v=2")
  job = JSON.parse(json_obj)
  create_jobs_array(job)
  erb :search
end