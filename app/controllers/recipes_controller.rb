class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find_or_create_by(api_id: params[:id])
    @recipe_info = Recipe.get_recipe(params[:id])
    @comments = Comment.where(recipe_id: params[:id])
    @comment = Comment.new
  end

  def retrieve_recipes
    recipes = Recipe.get_recipes_by_ingredient(params[:ingredient], 15)
    id = recipes.sample['id']
    redirect_to recipe_path(id)
  end
  def random_recipe
    recipe = Recipe.get_random
    id = recipe['id']
    redirect_to recipe_path(id)
  end

  # def create_comments
  #   @comment = Comment.new(text: text)
  #   if @comment.save
  #     p "Comment saved."
  #   else
  #     p "Not Saved"
  #   end
  # end

end
