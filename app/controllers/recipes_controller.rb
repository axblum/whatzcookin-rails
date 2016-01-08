class RecipesController < ApplicationController
  def index
    @recipe = Recipe.get_recipe('652927')
  end
end
