class RecipeIngredient < ActiveRecord::Base
  attr_accessible :ingredient_id, :quantity, :recipe_id, :unit
  belongs_to :recipe
  belongs_to :ingredient

  # [
  #    {"ingredient"=>#<Ingredient id: 28, name: "chocolate", created_at: "2012-08-27 18:33:28", updated_at: "2012-08-27 18:33:28">, "quantity"=>"1", "unit"=>"cups"},
  #    {"ingredient"=>#<Ingredient id: 28, name: "chocolate", created_at: "2012-08-27 18:33:28", updated_at: "2012-08-27 18:33:28">, "quantity"=>"1", "unit"=>"kg"}
  # ]
  def self.create_with_ingredients_and_recipe(ingredients_list, recipe)
    ingredients_list.each do |ingredient_data|
      ri = RecipeIngredient.new
      ri.quantity = ingredient_data["quantity"]
      ri.unit = ingredient_data["unit"]
      ri.ingredient = ingredient_data["ingredient"]
      ri.recipe = recipe
      ri.save
    end
  end

  def self.delete_relationship(recipe_id)
    ri = RecipeIngredient.find_by_recipe_id(recipe_id)
    ri.delete if ri
  end
end
