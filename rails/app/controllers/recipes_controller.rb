class RecipesController < ApplicationController

  def def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def show

  end

  def edit

  end


  def create
    binding.pry
    @recipe = Recipe.new(recipe_params)
  end

  def destroy

  end

  def update

  end

  private

  def recipe_params
    params.require(:recipe).permit(:powdergram, :grinding, :temperature, :time, :amount, :time1, :time2)
  end
end

