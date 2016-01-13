module TasteProfilesHelper
  # convert ingredients list in recipe to string
  def recipe_to_string
    ingredient_string = ""
    @recipe_info = Recipe.get_recipe(params[:id])
    @recipe_info['extendedIngredients'].each do |ingredient|
      ingredient_string += ingredient['name'] + " "
    end
    return ingredient_string.downcase
  end

  # check list of ingredients against the approved Ingredient objects
  def find_ingredients
    ingredients = []
    ing_array = recipe_to_string.split(" ")
    ing_array.each do |ing|
      ingredients << Ingredient.find_by(name: ing.capitalize!)
    end
    return (ingredients - [nil])
  end

  # List the Recipe's tastes based on ingredients that are there
  def taste_list
    flavors = ""
    find_ingredients.each do |ingredient_object|
      flavors += ingredient_object.taste + " "
    end
    return flavors
  end

  # Calculate taste profile and scale it
  def taste_counts
    taste_hash = Hash.new
    tastes = ['bitter', 'earthy', 'grassy', 'licorice', 'nutty', 'peppery', 'sour', 'spicy', 'sweet', 'woody']
    tastes.each do |taste|
      taste_hash[taste.to_sym] = taste_list.scan(taste.capitalize!).length
    end
    total = taste_hash.values.inject(0) { |a,b| a + b }
    adjusted_tastes = taste_hash.each { |k, v| taste_hash[k] = v/total.to_f }
    return adjusted_tastes
  end

  # Creates The Profile based on the 'adjusted tastes' hash
  def create_profile
    taste_profile = RecipeTasteProfile.create!(taste_counts)
    taste_profile.update_attributes(recipe_id: @recipe.id)
  end

  # Find all the recipes rated by the user
  def user_rated_recipes(user)
    rated = []
    user.ratings.each do |rating|
      rated << rating.recipe
    end
    p rated
    return rated
  end

  # find or create the recipe taste profiles
  def find_recipe_profiles(user)
    rated = user_rated_recipes(user)
    profiles = []
    rated.each do |recipe|
      profiles << RecipeTasteProfile.find_or_create_by(recipe_id: recipe.id)
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

  # # find a user's rated recipes
  # def user_rated_recipes(user)
  #   rated = []
  #   user.ratings.each do |rating|
  #     rated << rating.recipe
  #   end
  #   return rated
  # end

  # # find or create the recipe taste profiles
  # def find_recipe_profiles(user)
  #   rated = user_rated_recipes(user)
  #   profiles = []
  #   rated.each do |recipe|
  #     profiles << RecipeTasteProfile.find_or_create_by(recipe_id: recipe.id)
  #   end
  #   return profiles
  # end

  # def total_stars(user)
  #   rated = user_rated_recipes(user)
  #   rated.each do |rating|
  #     total += rating.stars
  #   end
  #   return total
  # end

  # # adjust the weight of the taste profiles
  # def adjust_weight(user)
  #   profiles = find_recipe_profiles(user)
  #   weighted_user_tastes =[]
  #   profiles.each do |profile|
  #     if profile.bitter != nil && !profile.bitter.nan?
  #       user_taste_hash = Hash.new
  #       p user_taste_hash[:bitter] = (profile.bitter * 3)
  #       p user_taste_hash[:earthy] = (profile.earthy * 3)
  #       p user_taste_hash[:grassy] = (profile.grassy * 3)
  #       p user_taste_hash[:licorice] = (profile.licorice * 3)
  #       p user_taste_hash[:nutty] = (profile.nutty * 3)
  #       p user_taste_hash[:peppery] = (profile.peppery * 3)
  #       p user_taste_hash[:sour] = (profile.sour * 3)
  #       p user_taste_hash[:spicy] = (profile.spicy * 3)
  #       p user_taste_hash[:sweet] = (profile.sweet * 3)
  #       p user_taste_hash[:woody] = (profile.woody * 3)
  #       p user_taste_hash
  #     end
  #     weighted_user_tastes << user_taste_hash
  #   end
  #   p weighted_user_tastes
  # end

  # def weigh_tastes(user)
  #   total = total_stars(user)
  # end

  # find the user's ratings for those recipes

  # using the weighted


  # find taste profile information for the rated recipes


        # p user_taste_hash[:bitter] = (profile.bitter * 3)
        # p user_taste_hash[:earthy] = (profile.earthy * 3)
        # p user_taste_hash[:grassy] = (profile.grassy * 3)
        # p user_taste_hash[:licorice] = (profile.licorice * 3)
        # p user_taste_hash[:nutty] = (profile.nutty * 3)
        # p user_taste_hash[:peppery] = (profile.peppery * 3)
        # p user_taste_hash[:sour] = (profile.sour * 3)
        # p user_taste_hash[:spicy] = (profile.spicy * 3)
        # p user_taste_hash[:sweet] = (profile.sweet * 3)
        # p user_taste_hash[:woody] = (profile.woody * 3)
        # p user_taste_hash

        # p (profile.bitter * 3)+0.01
        # p (profile.earthy * 3)+0.01
        # p (profile.grassy * 3)+0.01
        # p (profile.licorice * 3)+0.01
        # p (profile.nutty * 3)+0.01
        # p (profile.peppery * 3)+0.01
        # p (profile.sour * 3)+0.01
        # p (profile.spicy * 3)+0.01
        # p (profile.sweet * 3)+0.01
        # p (profile.woody * 3)+0.01

        # p (profile.bitter * 3)
        # p (profile.earthy * 3)
        # p (profile.grassy * 3)
        # p (profile.licorice * 3)
        # p (profile.nutty * 3)
        # p (profile.peppery * 3)
        # p (profile.sour * 3)
        # p (profile.spicy * 3)
        # p (profile.sweet * 3)
        # p (profile.woody * 3)



end
