class RecipesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  def index
    @recipes = Recipe.all
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end


  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect_to "/user/#{current_user.id}/show", notice: '削除に成功しました'
    else
      flash.now[:alert] = '削除に失敗しました'
      render :index
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe.id), notice: '更新に成功しました'
    else
      flash.now[:alert] = '更新に失敗しました'
      render :edit
    end
  end
end
