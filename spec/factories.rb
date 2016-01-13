FactoryGirl.define do
  factory :comment do
    text Faker::Lorem.sentence
  end

  factory :recipe do
    api_id Random.rand(1..100)
  end

  #  factory :user_id do
  #   user_id Random.rand(1..100)
  # end

  factory :user do
    email Faker::Internet.email
    password Faker::Internet.password
    #name?
  end
end
