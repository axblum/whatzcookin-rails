10.times do
  User.create!(name: Faker::Name.name,
               email: Faker::Internet.email,
               password: '12345678')
end


# [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].each do |num|
#   Rating.create!(stars: rand(1..5),
#                  user_id: num,
#                  recipe_id: 1)
# end

Recipe.create!(api_id: 640010)


200.times do
  Comment.create!(text: Faker::Lorem.paragraph,
                  user_id: rand(1..10),
                  recipe_id: rand(1..10))
end


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
CuisineStyle.create!(name: "jewish")
CuisineStyle.create!(name: "american")
CuisineStyle.create!(name: "cajun")
CuisineStyle.create!(name: "southern")
CuisineStyle.create!(name: "greek")
CuisineStyle.create!(name: "german")
CuisineStyle.create!(name: "nordic")
CuisineStyle.create!(name: "eastern european")
CuisineStyle.create!(name: "caribbean")
CuisineStyle.create!(name: "latin american")

# Create Cuisine Types Taste Profiles
cuisines = [[0.1034482759, 0.1034482759, 0.1034482759, 0, 0.06896551724,0.1379310345,0.1034482759,0.1379310345,0.2068965517,0.03448275862],[0.1428571429,0.07142857143,0.07142857143,0.07142857143,0.07142857143,0.07142857143,0.2142857143,0.2142857143,0.07142857143,0],[0.06666666667,0.1333333333,0,0,0.2,0.06666666667,0.2,0.2666666667,0.06666666667,0],[0.07692307692,0.07692307692,0.1538461538,0.07692307692,0.07692307692,0.1538461538,0.2307692308,0.1538461538,0,0],[0.08823529412,0.08823529412,0.08823529412,0.1176470588,0.02941176471,0.1176470588,0.1764705882,0.1470588235,0.1470588235,0],[0.15,0.05,0.1,0.05,0,0.15,0.2,0.25,0.05,0],[0.125,0.09375,0.03125,0.03125,0.0625,0.15625,0.09375,0.15625,0.21875,0.03125],[0.06896551724,0.2068965517,0.06896551724,0,0,0.1379310345,0.06896551724,0.06896551724,0.2413793103,0.1379310345],[0.1052631579,0.2105263158,0.1578947368,0.05263157895,0, 0.1052631579,0.1052631579,0.1052631579,0.05263157895,0.1052631579],[0.2083333333,0.08333333333,0.125,0.04166666667,0,0.2083333333,0.125,0.04166666667,0.125,0.04166666667],[0.125,0.04166666667,0.08333333333,0,0,0.2083333333,0.08333333333,0.125,0.2083333333,0.125],[0.06451612903,0.1290322581,0.06451612903,0,0.06451612903,0.1612903226,0.1612903226,0.03225806452,0.2580645161,0.06451612903],[0.1333333333,0.1333333333,0.03333333333,0,0,0.1666666667,0.03333333333,0.2,0.2,0.1],[0.06896551724,0.275862069,0.1034482759,0,0,0.2068965517,0.03448275862,0.06896551724,0.2068965517,0.03448275862],[0.08,0.24,0.04,0,0,0.2,0.08,0.12,0.2,0.04],[0.05263157895,0.2631578947,0,0,0,0.2105263158,0.05263157895,0.1578947368,0.1578947368,0.05263157895],[0.1666666667,0.2083333333,0.04166666667,0,0,0.1666666667,0.04166666667,0.2083333333,0.125,0.04166666667],[0.2352941176,0.05882352941,0.1764705882,0,0,0.1176470588,0.05882352941,0.2352941176,0.1176470588,0],[0.1428571429,0.2380952381,0.04761904762,0,0,0.09523809524,0.1904761905,0.04761904762,0.1904761905,0.04761904762],[0.09523809524,0.1428571429,0.2380952381,0,0,0.2857142857,0.09523809524,0.04761904762,0.09523809524,0],[0.03225806452,0.1612903226,0.1935483871,0.06451612903,0,0.2903225806,0.06451612903,0,0.1290322581,0.06451612903],[0.12,0.2,0.08,0,0,0.12,0.08,0.08,0.24,0.08],[0.1111111111,0.1666666667,0,0,0,0.1111111111,0.05555555556,0.1666666667,0.2777777778,0.1111111111],[0.1111111111,0.05555555556,0.1666666667,0,0.05555555556,0.2222222222,0.05555555556,0.1111111111,0.2222222222,0]]

i = 1
cuisines.each do |cuisine|
  CuisineTasteProfile.create!(bitter: cuisine[0],
                             earthy: cuisine[1],
                             grassy: cuisine[2],
                             licorice: cuisine[3],
                             nutty: cuisine[4],
                             peppery: cuisine[5],
                             sour: cuisine[6],
                             spicy: cuisine[7],
                             sweet: cuisine[8],
                             woody: cuisine[9],
                             cuisine_style_id: i)
  i += 1
end
