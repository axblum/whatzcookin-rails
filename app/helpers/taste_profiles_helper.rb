module TasteProfilesHelper
  # convert ingredients list in recipe to string
  def recipe_to_string(recipe_object)
    ingredient_string = ""
    @recipe_info = Recipe.get_recipe(recipe_object.api_id)
    @recipe_info['extendedIngredients'].each do |ingredient|
      ingredient_string += ingredient['name'] + " "
    end
    return ingredient_string.downcase
  end

  # check list of ingredients against the approved Ingredient objects
  def find_ingredients(recipe_object)
    ingredients = []
    ing_array = recipe_to_string(recipe_object).split(" ")
    ing_array.each do |ing|
      ingredients << Ingredient.find_by(name: ing.capitalize!)
    end
    return (ingredients - [nil])
  end

  # List the Recipe's tastes based on ingredients that are there
  def taste_list(recipe_object)
    flavors = ""
    find_ingredients(recipe_object).each do |ingredient_object|
      flavors += ingredient_object.taste + " "
    end
    return flavors
  end

  # Calculate taste profile and scale it
  def taste_counts(recipe_object)
    taste_hash = Hash.new
    tastes = ['bitter', 'earthy', 'grassy', 'licorice', 'nutty', 'peppery', 'sour', 'spicy', 'sweet', 'woody']
    tastes.each do |taste|
      taste_hash[taste.to_sym] = taste_list(recipe_object).scan(taste.capitalize!).length
    end
    total = taste_hash.values.inject(0) { |a,b| a + b }
    adjusted_tastes = taste_hash.each { |k, v| taste_hash[k] = v/total.to_f }
    return adjusted_tastes
  end

  # Creates The Profile based on the 'adjusted tastes' hash
  def create_recipe_profile(recipe_object)
    taste_profile = RecipeTasteProfile.create!(taste_counts(recipe_object))
    taste_profile.update_attributes(recipe_id: recipe_object.id)
    p "CREATED RECIPE PROFILE"
    p taste_profile
    return taste_profile
  end

  # Find all the recipes rated by the user return the recipe objects
  # def user_rated_recipes(user)
  #   rated = []
  #   user.ratings.each do |rating|
  #     rated << rating.recipe
  #   end
  #   return rated
  # end

  def find_favorite_recipes(user)
    faves = []
    faves << user.favorites.last.recipe
    # if user.favorites.length > 5
    #   for i in (user.favorites.length-6)...(user.favorites.length)
    #     faves << user.favorites[i].recipe
    #   end
    # else
    #   user.favorites.each do |favorite|
    #     faves << favorite.recipe
    #   end
    # end
    return faves
  end

  # find or create the recipe taste profiles
  def find_recipe_profiles(user)
    # rated = user_rated_recipes(user)
    profiles = []
    # rated.each do |recipe|
    #   profiles << create_recipe_profile(recipe)
    # end
    faves = find_favorite_recipes(user)
    faves.each do |recipe|
      profiles << create_recipe_profile(recipe)
    end
    return profiles
  end

  # Find the total number of stars
  # def total_stars(user)
  #   rated = user.ratings
  #   total = 0
  #   rated.each do |rating|
  #     total += rating.stars
  #   end
  #   return total
  # end

  # adjust the weight of the taste profiles
  def adjust_weight(user)
    profiles = find_recipe_profiles(user)
    weighted_user_tastes =[]
    user_taste_hash = Hash.new
    user_taste_hash[:bitter] =0
    user_taste_hash[:earthy] =0
    user_taste_hash[:grassy] =0
    user_taste_hash[:licorice] = 0
    user_taste_hash[:nutty] = 0
    user_taste_hash[:peppery] = 0
    user_taste_hash[:sour] =0
    user_taste_hash[:spicy] = 0
    user_taste_hash[:sweet] = 0
    user_taste_hash[:woody] = 0
    profiles.each do |profile|
      user_taste_hash[:bitter] += profile.bitter
      user_taste_hash[:earthy] += profile.earthy
      user_taste_hash[:grassy] += profile.grassy
      user_taste_hash[:licorice] += profile.licorice
      user_taste_hash[:nutty] += profile.nutty
      user_taste_hash[:peppery] += profile.peppery
      user_taste_hash[:sour] += profile.sour
      user_taste_hash[:spicy] += profile.spicy
      user_taste_hash[:sweet] += profile.sweet
      user_taste_hash[:woody] += profile.woody
    end
    return user_taste_hash
  end

  def weigh_tastes(user)
    taste_hash = adjust_weight(user)
    if user.ratings.count == 0
      total = 1
    else
      total = user.ratings.count
    end

    weighted_taste_hash = taste_hash.each { |k, v| taste_hash[k] = v/total }
    weighted_taste_hash[:user_id] = user.id
    return weighted_taste_hash
  end

  # using the user taste profile to find appropriate recipes

end

# Chinese Taste Profile = [0.1428571429,0.07142857143,0.07142857143,0.07142857143,0.07142857143,0.07142857143,0.2142857143,0.2142857143,0.07142857143,0]

# African Taste Profile = [0.1034482759, 0.1034482759, 0.1034482759, 0, 0.06896551724,0.1379310345,0.1034482759,0.1379310345,0.2068965517,0.03448275862]

# Japanese Taste Profile = [0.06666666667,0.1333333333,0,0,0.2,0.06666666667,0.2,0.2666666667,0.06666666667,0]

# Korean = [0.07692307692,0.07692307692,0.1538461538,0.07692307692,0.07692307692,0.1538461538,0.2307692308,0.1538461538,0,0]

# Vietnamese = [0.08823529412,0.08823529412,0.08823529412,0.1176470588,0.02941176471,0.1176470588,0.1764705882,0.1470588235,0.1470588235,0]

# Thai = [0.15,0.05,0.1,0.05,0,0.15,0.2,0.25,0.05,0]

# Indian = [0.125,0.09375,0.03125,0.03125,0.0625,0.15625,0.09375,0.15625,0.21875,0.03125]

# British = [0.06896551724,0.2068965517,0.06896551724,0,0,0.1379310345,0.06896551724,0.06896551724,0.2413793103,0.1379310345]

# Irish = [0.1052631579,0.2105263158,0.1578947368,0.05263157895,0,
# 0.1052631579,0.1052631579,0.1052631579,0.05263157895,0.1052631579]

# French = [0.2083333333,0.08333333333,0.125,0.04166666667,0,0.2083333333,0.125,0.04166666667,0.125,0.04166666667]


# Italian = [0.125,0.04166666667,0.08333333333,0,0,0.2083333333,0.08333333333,0.125,0.2083333333,0.125]

# Mexican = [0.06451612903,0.1290322581,0.06451612903,0,0.06451612903,0.1612903226,0.1612903226,0.03225806452,0.2580645161,0.06451612903]

# Spanish = [0.1333333333,0.1333333333,0.03333333333,0,0,0.1666666667,0.03333333333,0.2,0.2,0.1]

# Middle Eastern = [0.06896551724,0.275862069,0.1034482759,0,0,0.2068965517,0.03448275862,0.06896551724,0.2068965517,0.03448275862]

# Jewish = [0.08,0.24,0.04,0,0,0.2,0.08,0.12,0.2,0.04]


# American = [0.05263157895,0.2631578947,0,0,0,0.2105263158,0.05263157895,0.1578947368,0.1578947368,0.05263157895]

# Cajun = [0.1666666667,0.2083333333,0.04166666667,0,0,0.1666666667,0.04166666667,0.2083333333,0.125,0.04166666667]

# Southern = [0.2352941176,0.05882352941,0.1764705882,0,0,0.1176470588,0.05882352941,0.2352941176,0.1176470588,0]

# Greek = [0.1428571429,0.2380952381,0.04761904762,0,0,0.09523809524,0.1904761905,0.04761904762,0.1904761905,0.04761904762]

# German = [0.09523809524,0.1428571429,0.2380952381,0,0,0.2857142857,0.09523809524,0.04761904762,0.09523809524,0]

# Nordic = [0.03225806452,0.1612903226,0.1935483871,0.06451612903,0,0.2903225806,0.06451612903,0,0.1290322581,0.06451612903]


# Eastern European = [0.12,0.2,0.08,0,0,0.12,0.08,0.08,0.24,0.08]

# Caribbean = [0.1111111111,0.1666666667,0,0,0,0.1111111111,0.05555555556,0.1666666667,0.2777777778,0.1111111111]


# Latin American = [0.1111111111,0.05555555556,0.1666666667,0,0.05555555556,0.2222222222,0.05555555556,0.1111111111,0.2222222222,0]
