module RecipesHelper
  def list_ingredients(extendedIngredients)
    html_element_array = ""
    span = ""
    extendedIngredients.each do |ingredient|
      ingredient.each_value do |val|
        span = content_tag(:span, val)
      end
      html_element_array += content_tag(:div, span)
    end
    return html_element_array
  end

  def average_rating(recipe_object)
    return recipe_object.ratings.average(:stars).to_i
  end

  def user_rating(recipe_object)
    return Rating.find_by(user_id: current_user.id, recipe_id: recipe_object.id)
  end

  def rated_by?(recipe_object)
    if User.find(current_user.id).ratings.find_by(recipe_id: recipe_object.id)
      return true
    else
      return false
    end
  end

  def display_user_rating(recipe_object)
    if current_user && rated_by?(recipe_object)
      display_rating(user_rating(recipe_object), 'User')
    elsif current_user
      render '/ratings/new'
    else
      render '/ratings/log_in'
    end
  end
end
