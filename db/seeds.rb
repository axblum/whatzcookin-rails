10.times do
  User.create!(name: Faker::Name.name,
               email: Faker::Internet.email,
               password: '12345678')
end


[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].each do |num|
  Rating.create!(stars: rand(1..5),
                 user_id: num,
                 recipe_id: 1)
end

Recipe.create!(api_id: 640010)


200.times do
  Comment.create!(text: Faker::Lorem.paragraph,
                  user_id: rand(1..10),
                  recipe_id: rand(1..10))
end

NutritionalProfile.create!(user_id: 10)
# Populate restrictions
Restriction.create!(name: "pescetarian")
Restriction.create!(name: "lacto vegetarian")
Restriction.create!(name: "ovo vegetarian")
Restriction.create!(name: "vegan")
Restriction.create!(name: "vegetarian")

# Populate excluded ingredients

ExcludedIngredient.create!(name: "dairy")
ExcludedIngredient.create!(name: "egg")
ExcludedIngredient.create!(name: "gluten")
ExcludedIngredient.create!(name: "peanut")
ExcludedIngredient.create!(name: "sesame")
ExcludedIngredient.create!(name: "seafood")
ExcludedIngredient.create!(name: "shellfish")
ExcludedIngredient.create!(name: "soy")
ExcludedIngredient.create!(name: "sulfite")
ExcludedIngredient.create!(name: "tree nut")
ExcludedIngredient.create!(name: "wheat")


# Populate cuisine styles (a few more need to be filled below)
CuisineStyle.create!(name: "african")
CuisineStyle.create!(name: "chinese")
CuisineStyle.create!(name: "japanese")
CuisineStyle.create!(name: "korean")
CuisineStyle.create!(name: "vietnamese")
CuisineStyle.create!(name: "thai")
CuisineStyle.create!(name: "indian")
CuisineStyle.create!(name: "british")
CuisineStyle.create!(name: "irish")
CuisineStyle.create!(name: "french")
CuisineStyle.create!(name: "italian")
CuisineStyle.create!(name: "mexican")
CuisineStyle.create!(name: "spanish")
# CuisineStyle.create!(name: "middle eastern")
# CuisineStyle.create!(name: "spanish")
# CuisineStyles.create!(name: "spanish")
# CuisineStyles.create!(name: "spanish")
