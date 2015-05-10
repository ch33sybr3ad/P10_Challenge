require 'faker'

5.times do
  User.create(
    username: Faker::Internet.user_name,
    password: 123456,
    )
end

User.create(username: "jason", password: 1234)

fake_job = {
  jobtitle: "Fake Job Title", 
  company: "Fake Co.",
  location: "Nowhereville", 
  snippet: "you don't want to work here", 
  url: "www.google.com", 
  jobkey: 1,
}

Job.create(fake_job)