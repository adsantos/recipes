class Recipe < ActiveRecord::Base
  attr_accessible :name, :ingredients, :photo
  validates_presence_of :name
  has_attached_file :photo, :styles => {:medium => "300x300>", :thumb => "100x100>"}, :storage => :s3, :s3_credentials => S3_CONFIG, :path => "/:style/:id/:filename", :use_ssl => false, :bucket => "recipes-photos", url: ":s3_domain_url"

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  accepts_nested_attributes_for :ingredients

  has_many :recipe_steps
  has_many :steps, through: :recipe_steps

  # {:recipe => {:name=>"Bolo de bolacha", :ingredients=>["ingredient=chocolate&quantity=1&unit=cups", "ingredient=chocolate&quantity=1&unit=kg"], :steps=>["step 1\r\nstep 1", "step 1\r\nstep 2"]}}
  def self.new_with_ingredients_and_steps(params)
    # Extract and create/get ingredients
    ingredients = Ingredient.find_or_create_from_params(params[:recipe].delete(:ingredients))
    # Extract and create steps
    steps = Step.create_from_params(params[:recipe].delete(:steps)) || []
    # Create recipe
    recipe = Recipe.new(params[:recipe])
    recipe.steps = steps
    # Create recipe ingredients
    RecipeIngredient.create_with_ingredients_and_recipe(ingredients, recipe)
    # Return the recipe
    recipe
  end

  # {"name"=>"Tarte de laranja e limao", "ingredients"=>["ingredient=laranja&quantity=1&unit=kg"]}}
  def update_with_ingredients_and_steps(params)
    RecipeIngredient.delete_relationship(self.id)
    RecipeStep.delete_relationship(self.id)

    ingredients = Ingredient.find_or_create_from_params(params[:recipe].delete(:ingredients))
    # Extract and create steps
    steps = Step.create_from_params(params[:recipe].delete(:steps)) || []
    # Create recipe
    self.steps = steps
    # Create recipe ingredients
    RecipeIngredient.create_with_ingredients_and_recipe(ingredients, self)
    # Return the recipe
    update_attributes(params[:recipe])
  end

  def self.units
    ["gr","kg","cups", "unit(s)"]
  end

  def recipe_ingredients_details
    self.recipe_ingredients.map do |ri|
      {
        name: ri.ingredient.name,
        quantity: ri.quantity,
        unit: ri.unit
      }
    end
  end

end
