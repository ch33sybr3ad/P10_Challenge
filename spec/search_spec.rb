require 'spec_helper'

describe 'GET /search' do 
  before(:all) { User.delete_all }
  before(:all) { Job.delete_all }
  context 'when a user enters the page' do
    it "returns a status code of 200" do
      get '/search'
      expect(last_response.status).to eq(200)
    end

    it "includes search bar" do
      get '/search'
      expect(last_response.body).to include('form id="search-bar"')
      expect(last_response.body).to include('form id="home"')
    end
  end
end

describe 'GET /searchjob' do
  context "when a user refreshes page" do
    it "redirects back to /search page" do
      get '/searchjob'
      expect(last_response.status).to eq(302)
    end
  end
end

describe 'POST /searchjob' do
  context "when a user makes a search" do
    let(:@user) { User.create }
    it "return search results on the page" do
      post '/searchjob', { search: "Ruby", location: "San Francisco" }
      expect(last_response.body).to include('<p>Job Snippet:')
      expect(last_response.body).to include('<div class="job-company">')
    end
  end
end