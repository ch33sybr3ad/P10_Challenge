require 'spec_helper'


describe 'GET /favorite' do 
  before(:all) { User.delete_all }
  before(:all) { Job.delete_all }
  before(:all) { Relationship.delete_all }

  context "when user goes to favorite page" do
    it "shows all of the users favorited jobs" do
      User.create!(username: "jason", password: 12345)
      Job.create(jobtitle: "Intern", company: "Google", location: "Silicon Valley")
      Job.create(jobtitle: "Associate", company: "Apple", location: "Silicon Valley")
      user_id = User.first.id
      job_id = Job.first.id
      Relationship.create!(users_id: user_id, jobs_id: job_id)

      get '/favorite', {}, 'rack.session' => { :user_id => user_id }
      expect(last_response.body).to include('<h3><strong>Google</strong></h3>')
    end
  end
end

describe 'POST /favoritejob' do
  context "when user clicks favorite button" do
    it "create relationship between user and job listing" do
      job_id2 = Job.last.id
      post '/signin', { username: "jason", password: 12345 }
      user_id = User.where(username: "jason").first.id
      post '/favoritejob', { user_id: user_id, job_id: job_id2 }
      last_response.should be_redirect
      follow_redirect!
      expect(last_response.body).to include('<h2><strong>Associate</strong></h2>')
    end
  end
end

describe 'DELETE /favoritejob' do
  context "when user clicks delete favorite button" do
    it "delete relationship between user and job listing" do
      user_id = User.where(username: "jason").first.id
      job_id2 = Job.last.id
      post '/signin', { username: "jason", password: 12345 }
      delete '/favoritejob ', { user_id: user_id, job_id: job_id2 }
      last_response.should be_redirect
      follow_redirect!
      expect(last_response.body).to_not include('<h2><strong>Associate</strong></h2>')
    end
  end
end