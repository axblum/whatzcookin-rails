class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find_or_create_by(api_id: params[:id])
    @recipe_info = Recipe.get_recipe(params[:id])
    @comments = @recipe.comments
    p @comments
    @comment = @recipe.comments.new
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

  # def create_comments
  #   @comment = Comment.new(text: text)
  #   if @comment.save
  #     p "Comment saved."
  #   else
  #     p "Not Saved"
  #   end
  # end

end
