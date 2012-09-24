require 'cgi'

class Ingredient < ActiveRecord::Base
  attr_accessible :description, :name
  validates_presence_of :name

  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  def self.find_or_create_by_name(ingredient_name)
    Ingredient.find_by_name(ingredient_name) || Ingredient.create(name: ingredient_name)
  end

  # Input: ["ingredient=chocolate&quantity=1&unit=cups", "ingredient=chocolate&quantity=1&unit=kg"]
  # Output: [{"ingredient"=>#<Ingredient id: 28, name: "chocolate", created_at: "2012-08-27 18:33:28", updated_at: "2012-08-27 18:33:28">, "quantity"=>"1", "unit"=>"cups"}, {"ingredient"=>#<Ingredient id: 28, name: "chocolate", created_at: "2012-08-27 18:33:28", updated_at: "2012-08-27 18:33:28">, "quantity"=>"1", "unit"=>"kg"}]
  def self.find_or_create_from_params(list)
    list.reduce([]) do |array, e|
      ingredient_data = CGI.parse(e)
      ingredient_name = ingredient_data["ingredient"].first
      ingredient_data["ingredient"] = Ingredient.find_or_create_by_name(ingredient_name)
      ingredient_data["quantity"] = ingredient_data["quantity"].first
      ingredient_data["unit"] = ingredient_data["unit"].first
      array << ingredient_data
    end
  end

end
