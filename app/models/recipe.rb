class Recipe < ActiveRecord::Base
  attr_accessible :name, :ingredients
  validates_presence_of :name

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  accepts_nested_attributes_for :ingredients

  has_many :recipe_steps
  has_many :steps, through: :recipe_steps

  def self.new_with_ingredients(params)
    ingredients = Ingredient.from_params(params[:recipe].delete(:ingredients))
    recipe = Recipe.new(params[:recipe])
    recipe.ingredients << ingredients
    recipe
  end

end
