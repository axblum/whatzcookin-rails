class RecipesController < ApplicationController
  include TasteProfilesHelper
  def show
    @recipe = Recipe.find_or_create_by(api_id: params[:id])
    @recipe_info = Recipe.get_recipe(params[:id])
    @comments = @recipe.comments.order(:created_at)
    @comment = Comment.new
    if user_signed_in?
      @user_rating = Rating.find_by(user_id: current_user.id, recipe_id: @recipe.id)
    end
    if request.xhr?
      render :show,layout:false
    else
      render :show
    end
  end

  def suggestions
    cuisine_profile = most_similar(all_cuisine_styles(current_user))
    recipes = Recipe.suggested_recipe(similar_cuisine_style(cuisine_profile).name)
    unless recipes.parsed_response.empty?
      recipes = recipes.parsed_response["results"]
      id = recipes.sample['id']
      redirect_to recipe_path(id)
    else
      flash[:error] = "We can't seem to find that ingredient"
      redirect_to root_path
    end
  end

  def retrieve_recipes
    if user_signed_in?
      restrictions_hash = current_user.build_personalized_hash
      if params[:ingredient].empty?
        flash[:error] = "You must enter an Ingredient"
        redirect_to root_path
      else
        recipes = Recipe.get_personalized_recipe(params[:ingredient],restrictions_hash)
        unless recipes.parsed_response["results"].empty?
          recipes = recipes.parsed_response["results"]
          id = recipes.sample['id']
          redirect_to recipe_path(id)
        else
          flash[:error] = "We can't seem to find that ingredient"
          redirect_to root_path
        end
      end
    else
      recipes = Recipe.get_recipes_by_ingredient(params[:ingredient], 15)
      unless recipes.parsed_response.empty?
        id = recipes.sample['id']
        redirect_to recipe_path(id)
      else
        flash[:error] = "We can't seem to find that ingredient"
        redirect_to root_path
      end
    end
  end

  def random_recipe
    recipe = Recipe.get_random
    id = recipe['id']
    redirect_to recipe_path(id)
  end
end
