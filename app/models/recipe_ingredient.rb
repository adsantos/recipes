class RecipeIngredient < ActiveRecord::Base
  attr_accessible :ingredient_id, :quantity, :recipe_id, :unit
  belongs_to :recipe
  belongs_to :ingredient
end
