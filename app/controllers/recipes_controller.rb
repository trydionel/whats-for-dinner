class RecipesController < ApplicationController
  respond_to :json
  wrap_parameters :recipe, include: [:name, :description]

  def index
    respond_with Recipe.all
  end

  def show
    respond_with Recipe.find(params[:id])
  end

  def create
    respond_with Recipe.create(params[:recipe])
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update_attributes(params[:recipe])
    respond_with recipe
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    respond_with recipe
  end

end
