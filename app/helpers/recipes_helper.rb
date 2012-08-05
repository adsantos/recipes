module RecipesHelper

  def ingredient_description_text(ingredient)
    if ingredient.description.nil?
      "Not available"
    else
      ingredient.description
    end
  end

end
