class WelcomeController < ApplicationController
  def index
    @recipe = Recipe.new
  end
end
