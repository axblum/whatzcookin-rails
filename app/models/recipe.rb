class Recipe < ActiveRecord::Base
  has_many :comments
  has_many :ratings
  has_many :favorites
  validates_presence_of :api_id
  def self.get_recipes_by_ingredient(ingredients, limit)
    search_params = ingredients.gsub(/,\s?/, "%2C").gsub(" ", "+")
    response = HTTParty.get "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?ingredients=#{search_params}&number=#{limit}",
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

  def self.get_random
    id = rand(1..100000)
    response = self.get_recipe(id)
    while response.code !=200
      id = rand(1..100000)
      response = self.get_recipe(id)
    end
    return response
  end
end

