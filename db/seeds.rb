10.times do
  User.create!(name: Faker::Name.name,
               email: Faker::Internet.email,
               password: '12345678')
end


20.times do
  Comment.create!(text: Faker::Lorem.paragraph,
                  user_id: rand(1..10))
end
