class RecipesController < ApplicationController
  def show
    @recipe = Recipe.get_recipe(params[:id])
    require 'pp'
    pp @recipe
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
