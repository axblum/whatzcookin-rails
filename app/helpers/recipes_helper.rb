module RecipesHelper
  def list_ingredients(extendedIngredients)
    html_element_array = ""
    span = ""
    p extendedIngredients
    extendedIngredients.each do |ingredient|
      ingredient.each_value do |val|
        span = content_tag(:span, val)
      end
      html_element_array += content_tag(:div, span)
    end
    return html_element_array
  end
end
