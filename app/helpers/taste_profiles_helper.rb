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
    taste_profile.update_attributes(recipe_id: @recipe.id)
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
    user.favorites.each do |favorite|

    end
  end

  # find or create the recipe taste profiles
  def find_recipe_profiles(user)
    p "Finding Recipe Profiles && " * 100
    rated = user_rated_recipes(user)
    p rated
    p "HERE NOW"

    profiles = []
    rated.each do |recipe|
      p recipe
      p "HERE HERE HERE HERE HERE " * 100
      p create_recipe_profile(recipe)
      profiles << create_recipe_profile(recipe)
    end
    p profiles
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


end
