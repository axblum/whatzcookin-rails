class RecipeTasteProfile < TasteProfile
  belongs_to :recipe, foreign_key: "recipe_id"

  def calculate_taste_profile
    p "$ & " * 100
    p "hitting this route"
  end
end
