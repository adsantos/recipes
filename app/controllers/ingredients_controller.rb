class IngredientsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]
  respond_to :html

  def index
    @ingredients = Ingredient.all
    respond_with @ingredients
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(params[:ingredient])
    if @ingredient.save
      flash[:message] = "Ingredient saved successfully"
      respond_with @ingredient
    else
      respond_with @ingredient
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
    respond_with @ingredient
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update_attributes(params[:ingredient])
      flash[:message] = "Ingredient updated successfully"
    end
    respond_with @ingredient
  end

  def destroy
    Ingredient.find(params[:id]).delete
    redirect_to :action => 'index'
  end

  def show
    @ingredient = Ingredient.find(params[:id])
    respond_with @ingredient
  end
end
