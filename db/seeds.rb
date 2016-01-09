# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  User.create!(name: Faker::Name.name,
               email: Faker::Internet.email,
               password: '12345678')
end


20.times do
  Comment.create!(text: Faker::Lorem.paragraph,
                  user_id: rand(1..10))
end
