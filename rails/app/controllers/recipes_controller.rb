class RecipesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  def index
    @recipes = Recipe.where(['status = ?', true])
  end

  def new
    @recipe = Recipe.new
    @grinding = ["極細挽き","細引き","中細挽き","中挽き","中粗挽き","粗挽き"]
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to "/users/#{current_user.id}/show"
    else
      @grinding = ["極細挽き","細挽き","中細挽き","中挽き","中粗挽き","粗挽き"]
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect_to "/user/#{current_user.id}/show"
    else
      render :index
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe.id)
    else
      render :edit
    end
  end

  private

    def recipe_params
      params.require(:recipe).permit(:powdergram, :grinding, :temperature, :time, :amount, :time1, :time2, :status)
    end
end
