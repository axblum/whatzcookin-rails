class RecipesController < ApplicationController
  def show
    @recipe = Recipe.get_recipe(params[:id])
  end

  def retrieve_recipes
    recipes = Recipe.get_recipes_by_ingredient(params[:ingredient], 15)
    id = recipes.sample['id']
    redirect_to recipe_path(id)
  end
end
