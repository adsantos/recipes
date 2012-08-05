class RecipesController < ApplicationController

  respond_to :html

  def index
    @recipes = Recipe.all
    respond_with @recipes
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      flash[:message] = "Recipe saved successfully"
      respond_with @recipe
    else
      respond_with @recipe
    end
  end

  def update
    recipe = Recipe.find(params[:id])
    if recipe.update_attributes(params[:recipe])

    end
  end

  def destroy
  end

  def show
    @recipe = Recipe.find(params[:id])
    respond_with @recipe
  end

  def new
    @recipe = Recipe.new
  end
end
