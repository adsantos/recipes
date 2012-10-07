class RecipeStep < ActiveRecord::Base
  attr_accessible :recipe_id, :step_id
  belongs_to :recipe
  belongs_to :step

  def self.delete_relationship(recipe_id)
    ri = RecipeIngredient.find_by_recipe_id(recipe_id)
    ri.delete if ri
  end

end
