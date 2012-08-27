class Ingredient < ActiveRecord::Base
  attr_accessible :description, :name
  validates_presence_of :name

  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  def self.from_params(list)
    if list
      list.delete_if {|e| e.empty?}
      list.reduce([]) {|acc, e|
        acc << Ingredient.find(e)
        acc
      }
    end
  end

  def self.new_from_params(list)
    list.map{|ingredient_name| Ingredient.create(name: ingredient_name)} if list
  end


end
