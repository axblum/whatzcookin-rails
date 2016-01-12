FactoryGirl.define do
  factory :comment do
    text Faker::Lorem.sentence
  end

  factory :user do
    email Faker::Internet.email
    password Faker::Internet.password
    #name?
  end
end
