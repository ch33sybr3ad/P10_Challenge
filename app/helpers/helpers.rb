helpers do

  def login(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logout
    session[:user_id] = nil
  end

  def find_company_information(company)
    company = HTTParty.get("http://api.glassdoor.com/api/api.htm?t.p=35408&t.k=ebFf3MTNqwe&userip=0.0.0.0&useragent=&format=json&v=1&action=employers&q=#{company.gsub(" ", "%20")}")
    information = company["response"]["employers"][0]
    if !information
      not_found = {
        "website" => " ",
        "overallRating" => " ",
        "squareLogo" => "https://www.jippostore.com/jippo/img/logo-j.png",
      }
      return not_found
    else 
      return information
    end
  end


  def create_jobs_array(parsed_obj)
    @jobs = []
    parsed_obj["results"].each do |result|
      info = find_company_information(result["company"])
      @jobs << Job.new(
        jobtitle: result["jobtitle"], 
        company: result["company"],
        location: result["formattedLocation"], 
        snippet: result["snippet"],
        url: result["url"],
        jobkey: result["jobkey"],
        website: info["website"],
        rating:  info["overallRating"],
        logo: info["squareLogo"],
        )
        #if jobs.save push into @jobs array
      end
  end

  def find_job(index)
    @job = Job.where(id: index).first
  end 

  def find_company(name)
    @company = HTTParty.get("http://api.glassdoor.com/api/api.htm?t.p=35408&t.k=ebFf3MTNqwe&userip=0.0.0.0&useragent=&format=json&v=1&action=employers&q=#{name.gsub(" ", "%20")}")
    @information = @company["response"]["employers"][0]

  end

end