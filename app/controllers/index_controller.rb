get '/' do
  erb :index
end

get '/info' do 
  @job = HTTParty.get('http://api.glassdoor.com/api/api.htm?t.p=35408&t.k=ebFf3MTNqwe&userip=0.0.0.0&useragent=&format=json&v=1&action=employers')
  content_type :json
  @job.to_json
  puts "######"
  puts @job["response"]["employers"][2]["name"] #.each { |x| puts x  }
  puts "######"
end


#API pass in action/parameters/values

# http://api.glassdoor.com/api/api.htm?t.p=35408&t.k=ebFf3MTNqwe&userip=0.0.0.0&useragent=&format=json&v=1&action=employers
# request for Target Co.

# @job = HTTParty.get('http://api.glassdoor.com/api/api.htm?t.p=35408&t.k=ebFf3MTNqwe&userip=0.0.0.0&useragent=&format=json&v=1&action=employers')

# content_type :json
# @job.to json 

# create api env file