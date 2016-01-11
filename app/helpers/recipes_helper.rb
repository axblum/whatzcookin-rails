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

  def display_average_rating(averageRating)
    case averageRating
    when 0
      render '/ratings/no_star'
    when 1
      render '/ratings/one_star'
    when 2
      render '/ratings/two_star'
    when 3
      render '/ratings/three_star'
    when 4
      render '/ratings/four_star'
    when 5
      render '/ratings/five_star'
    end
  end

  def display_rating(rating, option)
    @option = option
    case rating
    when 0
      render '/ratings/no_star'
    when 1
      render '/ratings/one_star'
    when 2
      render '/ratings/two_star'
    when 3
      render '/ratings/three_star'
    when 4
      render '/ratings/four_star'
    when 5
      render '/ratings/five_star'
    end
  end

  def display_user_rating(recipe_object)
    if current_user && current_user.ratings.find_by(recipe_id: recipe_object.id)
      user_rating = User.find(current_user.id).ratings.find_by(recipe_id: recipe_object.id).stars
      p user_rating
      display_rating(user_rating, 'User')
    else
      render '/ratings/new'
    end
  end
end
