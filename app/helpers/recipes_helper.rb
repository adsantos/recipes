module RecipesHelper

  def ingredient_description_text(ingredient)
    if ingredient.description.nil?
      "Not available"
    else
      ingredient.description
    end
  end

  def build_recipe_link(recipe)
    content_tag :h3 do
      concat link_to recipe.name, recipe, class: "recipe_link"
    end
  end

  def build_recipe_caption(recipe)
    content_tag(:div, class: "caption") do
      concat build_recipe_link(recipe)
      if current_user
        concat link_to 'Show', recipe, class:"btn"
        concat link_to 'Edit', edit_recipe_path(recipe), class:"btn"
        concat link_to 'Remove', recipe, :confirm => 'Are you sure?', :method => :delete, class:"btn"
      end
    end
  end

  def build_recipe_markup(recipe)
    content_tag :div, class: "thumbnail" do
      concat image_tag("http://placehold.it/300x200")
      concat build_recipe_caption(recipe)
    end
  end

end
