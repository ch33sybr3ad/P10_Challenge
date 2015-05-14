require 'spec_helper'

describe 'GET /home' do
  before(:all) { User.delete_all }

  context "when a user is logged in" do
    it "gives access to user" do
      User.create!(username: "jason", password: 12345)
      user_id = User.first.id
      get '/home', {}, 'rack.session' => { :user_id => user_id }
      expect(last_response).to be_ok
    end
  end

  context "when a user is not logged in" do
    it "returns a status code of 404" do
      get '/home', {}, 'rack.session' => { :user_id => nil }
      expect(last_response.status).to eq(404)
    end
  end
end

describe 'POST /signin' do
  context "when a valid user signs in" do
    it "signs the user in" do
      post '/signin', { username: "jason", password: 12345 }
      last_response.should be_redirect
      follow_redirect!
    end
  end

  context "when a invalid user signs in" do
    it "returns status of 404" do
      post '/signin', { username: "banana", password: 12345 }
      expect(last_response.status).to eq(404)
    end
  end
end

describe 'POST /signup' do
  context "when a valid user signs up" do
    it "creates a new user" do
      post '/signup', { username: "darwin", password: 12345 }
      expect(User.count).to eq(2)
    end
  end

  context "when a duplicate user signs up" do
    it "does not creates a new user" do
      post '/signup', { username: "darwin", password: 12345 }
      expect(User.count).to eq(2)
      # expect{ User.create(username: "darwin", password: 12345)}.to change { User.count }.by(0)
    end
  end
end

describe 'GET /logout' do
  context "when a user logs out" do
    it "set session[:user_id] to nil" do
      get '/logout' 
      last_response.should be_redirect
      follow_redirect!
      expect(@user).to be (nil)
    end
  end
end