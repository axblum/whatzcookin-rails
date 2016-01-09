class Recipe < ActiveRecord::Base
  def self.get_recipes_by_ingredient(ingredient, limit)
    response = HTTParty.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?ingredients=#{ingredient}&number=#{limit}",
    headers:{
      "X-Mashape-Key" => ENV['SPOONACULAR_API'],
      "Accept" => "application/json"
    }
    return response
  end

  def self.get_recipe(id)
    response = HTTParty.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/#{id}/information
",
    headers:{
      "X-Mashape-Key" => ENV['SPOONACULAR_API'],
      "Accept" => "application/json"
    }
    return response
  end
end

