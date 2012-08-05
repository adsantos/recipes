class RecipeStep < ActiveRecord::Base
  attr_accessible :recipe_id, :step_id
  belongs_to :recipe
  belongs_to :step
end
