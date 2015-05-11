require 'faker'

5.times do
  User.create(
    username: Faker::Internet.user_name,
    password: 123456,
    )
end

User.create(username: "jason", password: 1234)

fake_job = {
  jobtitle: Faker::Commerce.product_name, 
  company: Faker::Commerce.department,
  location: Faker::Address.city, 
  snippet: "you don't want to work here", 
  url: "www.google.com", 
  jobkey: 1,
}

fake_job2 = {
  jobtitle: Faker::Commerce.product_name, 
  company: Faker::Commerce.department,
  location: Faker::Address.city, 
  snippet: "you don't want to work here", 
  url: "www.google.com", 
  jobkey: 1,
}

Job.create(fake_job)
Job.create(fake_job2)

Relationship.create(users_id: 1, jobs_id: 1)
Relationship.create(users_id: 1, jobs_id: 2)
Relationship.create(users_id: 2, jobs_id: 1)