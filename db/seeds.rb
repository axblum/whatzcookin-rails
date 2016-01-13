# 10.times do
#   User.create!(name: Faker::Name.name,
#                email: Faker::Internet.email,
#                password: '12345678')
# end


# [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].each do |num|
#   Rating.create!(stars: rand(1..5),
#                  user_id: num,
#                  recipe_id: 1)
# end

# Recipe.create!(api_id: 640010)


# 200.times do
#   Comment.create!(text: Faker::Lorem.paragraph,
#                   user_id: rand(1..10),
#                   recipe_id: rand(1..10))
# end

# Create Ingredients List

ingredientsHash = { "Achiote" => "Nutty Sweet Peppery",
"All Spice" => "Earthy Sweet",
"Amchoor" => "Sour Sweet",
"Anchovies" => "Salty",
"Anise Seed" => 'Licorice',
"Annatto Seeds" => "Nutty Sweet Peppery",
"Apple Cider Vinegar" => "Sweet",
"Asafetida" => "Spicy Bitter",
"Ash Tree Berries" => "Sour Bitter",
"Balsamic Vinegar"=>"Sweet Sour",
"Banana Leaves" => "Grassy",
"Basil" => "Sweet Peppery",
"Bay" => "Bitter Peppery Sweet",
"BBQ Sauce" => 'Sweet',
"Beer"=>"Bitter",
"Borage"=>"Grassy",
"Cardamom"=>"Sweet",
"Caraway"=> "Bitter Earthy",
"Cayenne"=>"Spicy",
"Celery"=> "Grassy Bitter Sweet",
"Chervil" =>"Grassy Licorice",
"Chili"=>"Spicy",
"Chilli"=>"Spicy",
"Chilies"=>"Spicy",
"Chipilin"=>"Earthy Sour",
"Chives"=>"Peppery",
"Cilantro"=>"Grassy Sour",
"Cinnamon"=>"Earthy Sweet",
"Cloves"=>"Earthy Sweet",
"Cocao"=> "Bitter",
"Cacao" =>"Bitter",
"Coffee"=>"Bitter",
"Coriander" =>"Earthy Peppery",
"Cumin" =>"Peppery Spicy",
"Mustard" =>"Spicy",
"Dill"=>"Grassy Peppery Sour",
"Epazote" =>"Sour",
"Fish Sauce"=>"Salty",
"Fennel" =>"Licorice",
"Fenugreek"=>"Nutty Sweet",
"Feta"=>"Sour Salty",
"Galangal"=>"Spicy Earthy",
"Garlic"=>"Bitter Spicy",
"Ginger"=>"Sour Earthy",
"Grapefruit"=>"Bitter",
"Cheese"=>"Salty",
"Harissa"=>"Spicy",
"Hibiscus"=>"Sour",
"Hojo Santa"=>"Peppery Earthy",
"Honey"=>"Sweet",
"Horseradish"=>"Spicy",
"Jam"=>"Sweet",
"Juniper"=>"Peppery Sour",
"Kala Namak"=>"Salty",
"Ketchup"=>"Sweet",
"Leeks"=>"Bitter Sour",
"Lemon"=>"Sour",
"Lemongrass"=>"Zesty Sour",
"Lime"=>"Sour",
"Syrup"=>"Sweet",
"Marjoram"=>"Grassy Sweet Earthy",
"Chocolate"=>"Sweet",
"Mint"=>"Sweet Grassy",
"Miso"=>"Salty",
"Molasses"=>"Sweet",
"Mustard Seed"=>"Spicy",
"Nettle"=>"Grassy Peppery",
"Nettles"=>"Grassy Peppery",
"Nigella"=>"Peppery Bitter Sweet",
"Nori"=>"Salty",
"Nutmeg"=>"Sweet Woody Peppery",
"Onion"=>"Bitter Sour",
"Orange"=>"Sour",
"Oregano"=>"Earthy Peppery",
"Paprika"=>"Sweet Spicy",
"Paracress"=>"Grassy",
"Parsley"=>"Peppery Grassy",
"Poppy Seed"=>"Nutty",
"Pepper"=>"Spicy",
"Pickled"=>"Salty Sour",
"Piloncillo"=>"Sweet",
"Purslane"=>"Bitter Sour Peppery",
"Rosemary"=>"Earthy Woody",
"Saffron"=>"Spicy Bitter",
"Sage"=>"Woody",
"Salt"=>"Salty",
"Sansho"=>"Spicy",
"Savory"=>"Peppery",
"Seaweed"=>"Salty",
"Sesame Seed"=>"Nutty",
"Shallots"=>"Bitter Sour",
"Sour Cream"=>"Sour",
"Soy Sauce"=>"Salty",
"Star Anise"=>"Licorice",
"Stevia"=>"Sweet",
"Sugar"=>"Sweet",
"Sumac"=>"Sour",
"Tamarind"=>"Sweet Sour",
"Tarragon"=>"Peppery Licorice",
"Thyme"=>"Earthy Grassy",
"Tomato"=>"Sour",
"Tumeric"=>"Peppery Bitter",
"Vanilla"=>"Sweet Woody",
"Wasabi"=>"Spicy",
"Yogurt"=>"Sour"}

ingredientsHash.each_pair { |key, value| Ingredient.create!(name:key, taste: value)}

NutritionalProfile.create!(user_id: 10)
# Populate restrictions
DietaryRestriction.create!(name: "pescetarian")
DietaryRestriction.create!(name: "lacto vegetarian")
DietaryRestriction.create!(name: "ovo vegetarian")
DietaryRestriction.create!(name: "vegan")
DietaryRestriction.create!(name: "vegetarian")

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
CuisineStyle.create!(name: "middle eastern")
CuisineStyle.create!(name: "spanish")
# CuisineStyles.create!(name: "spanish")
# CuisineStyles.create!(name: "spanish")
