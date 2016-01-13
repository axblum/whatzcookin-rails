class RecipeTasteProfile < TasteProfile
  belongs_to :recipe, foreign_key: "recipe_id"
end
