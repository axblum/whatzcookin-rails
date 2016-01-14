class CuisineTasteProfile < TasteProfile
  belongs_to :cuisine_style, foreign_key: "cuisine_id"
end
