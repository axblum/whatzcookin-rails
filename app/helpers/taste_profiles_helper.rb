module TasteProfilesHelper
  def recipe_to_string
    ingredient_string = ""
    @recipe_info = Recipe.get_recipe(params[:id])
    @recipe_info['extendedIngredients'].each do |ingredient|
      ingredient_string += ingredient['name'] + " "
    end
    return ingredient_string.downcase
  end

  def find_ingredients
    ingredients = []
    ing_array = recipe_to_string.split(" ")
    ing_array.each do |ing|
      ingredients << Ingredient.find_by(name: ing.capitalize!)
    end
    return (ingredients - [nil])
  end

  def taste_list
    flavors = ""
    find_ingredients.each do |ingredient_object|
      flavors += ingredient_object.taste + " "
    end
    return flavors
  end

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
  # now need to calculate the taste profile from the list of tastes
  def create_profile
    taste_profile = RecipeTasteProfile.create!(taste_counts)
    taste_profile.update_attributes(recipe_id: @recipe.id)
  end
end
