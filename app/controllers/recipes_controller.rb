class RecipesController < ApplicationController

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
      taste_hash[taste] = taste_list.scan(taste.capitalize!).length
    end
    return taste_hash
  end
  # now need to calculate the taste profile from the list of tastes

  def calculate_taste

  end

  def show
    taste_counts
    @recipe = Recipe.find_or_create_by(api_id: params[:id])
    @recipe_info = Recipe.get_recipe(params[:id])
    @comments = @recipe.comments.order(:created_at)
    @comment = Comment.new
    if request.xhr?
      render :show,layout:false
    else
      render :show
    end
  end


  def retrieve_recipes
    recipes = Recipe.get_recipes_by_ingredient(params[:ingredient], 15)
    unless recipes.parsed_response.empty?
      id = recipes.sample['id']
      redirect_to recipe_path(id)
    else
      flash[:error] = "We can't seem to find that ingredient"
      redirect_to root_path
    end
  end

  def random_recipe
    recipe = Recipe.get_random
    id = recipe['id']
    redirect_to recipe_path(id)
  end
end
