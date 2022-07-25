# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

testuser = User.create(name: "test user", email: "testuser@mail.com", password:"123456")

20.times do |n|
    name = Faker::Name.name
    email = "testuser#{n}@mail.com"
    password = "123456"
    User.create!(name: name, email: email, password: password)
end

users = User.order(:created_at).take(6)

10.times do
    body = Faker::Lorem.sentence(word_count: 5)
    users.each { |user| user.posts.create!(body: body) }
end