class RecipesController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]
  respond_to :html, :js

  def index
    puts params.inspect
    @search = Recipe.search(params[:q])
    @recipes = @search.result.page(params[:page]).per(9)
    respond_with @recipes
  end

  def create
    @recipe = Recipe.new_with_ingredients_and_steps(params)
    if @recipe.save
      flash[:message] = "Recipe saved successfully"
      respond_with @recipe
    else
      respond_with @recipe
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    respond_with @recipe
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(params[:recipe])
      flash[:message] = "Recipe updated successfully"
    end
    respond_with @recipe
  end

  def destroy
    Recipe.find(params[:id]).delete
    redirect_to :action => 'index'
  end

  def show
    @recipe = Recipe.find(params[:id])
    respond_with @recipe
  end

  def new
    @recipe = Recipe.new
  end
end
