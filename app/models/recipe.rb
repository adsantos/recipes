class Recipe < ActiveRecord::Base
  attr_accessible :name

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  has_many :recipe_steps
  has_many :steps, through: :recipe_steps
end