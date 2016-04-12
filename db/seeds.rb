User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

             
User.create!(name:  "foobar",
             email: "foobar@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

             
User.create!(name:  "barfoo",
             email: "barfoo@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             activated: true,
             activated_at: Time.zone.now)


99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
50.times do
  title = Faker::Lorem.sentence(5).first(50)
  body = Faker::Lorem.sentence(5)
  users.each do |user|
    entry = user.entries.create!(title: title, body: body)
  end
end

entries = Entry.order(:created_at).take(50)
entries.each do |entry|
  rand(0..5).times do
    content = Faker::Lorem.sentence(5).first(140)
    entry.comments.create!(content: content)
  end
end
    

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }