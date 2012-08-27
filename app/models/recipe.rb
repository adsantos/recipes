class Recipe < ActiveRecord::Base
  attr_accessible :name, :ingredients
  validates_presence_of :name

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  accepts_nested_attributes_for :ingredients

  has_many :recipe_steps
  has_many :steps, through: :recipe_steps

  def self.new_with_ingredients_and_steps(params)
    ingredients = Ingredient.from_params(params[:recipe].delete(:ingredients))
    new_ingredients = Ingredient.new_from_params(params[:recipe].delete(:new_ingredients)) || []
    steps = Step.from_params(params[:recipe].delete(:steps)) || []
    recipe = Recipe.new(params[:recipe])
    recipe.ingredients << ingredients.concat(new_ingredients)
    recipe.steps << steps
    recipe
  end

end
