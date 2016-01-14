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
    return taste_profile
  end

  def find_favorite_recipes(user)
    faves = []
    if user.favorites.length > 3
      for i in (user.favorites.length-4)...(user.favorites.length)
        faves << user.favorites[i].recipe
      end
    else
      user.favorites.each do |favorite|
        faves << favorite.recipe
      end
    end
    return faves
  end

  # find or create the recipe taste profiles
  def find_recipe_profiles(user)
    profiles = []
    faves = find_favorite_recipes(user)
    faves.each do |recipe|
      profiles << create_recipe_profile(recipe)
    end
    return profiles
  end

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
    if user.favorites.count == 0
      total = 1
    else
      total = user.favorites.count
    end
    weighted_taste_hash = taste_hash.each { |k, v| taste_hash[k] = v/total }
    weighted_taste_hash[:user_id] = user.id
    return weighted_taste_hash
  end

  # using the user taste profile to find appropriate recipes
  # calculate the differences between the user and the country
  def taste_array(user)
    tastes = user.user_taste_profile
    return [tastes.bitter, tastes.earthy, tastes.grassy, tastes.licorice, tastes.nutty, tastes.peppery, tastes.sour, tastes.spicy, tastes.sweet, tastes.woody]
  end

  def compare_profiles(profile_1, profile_2)
    aggregate_difference = 0
    aggregate_difference += (profile_1.bitter - profile_2.bitter)
    aggregate_difference += (profile_1.earthy - profile_2.earthy)
    aggregate_difference += (profile_1.grassy - profile_2.grassy)
    aggregate_difference += (profile_1.licorice - profile_2.licorice)
    aggregate_difference += (profile_1.nutty - profile_2.nutty)
    aggregate_difference += (profile_1.peppery - profile_2.peppery)
    aggregate_difference += (profile_1.sour - profile_2.sour)
    aggregate_difference += (profile_1.spicy - profile_2.spicy)
    aggregate_difference += (profile_1.sweet - profile_2.sweet)
    aggregate_difference += (profile_1.woody - profile_2.woody)
    return aggregate_difference.abs
  end

  def all_cuisine_styles(user)
    differences = []
    exists = CuisineTasteProfile.where.not(cuisine_style_id: nil)
    exists.each do |cuisine_profile|
      differences << compare_profiles(cuisine_profile, user.user_taste_profile)
    end
    return differences
  end

  def most_similar(array)
    index = array.rindex(array.min)
    return CuisineTasteProfile.find(index+1)
  end

  def similar_cuisine_style(taste_profile)
    return CuisineStyle.find(taste_profile.cuisine_style_id)
  end
end
