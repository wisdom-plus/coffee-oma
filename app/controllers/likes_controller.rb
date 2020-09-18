class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = current_user.create_like(params[:product_id])
    if @like.save
      render 'create.js.erb'
    else
      flash.now[:alert] = "ライクに失敗しました"
      redirect_to product_path(params[:product_id])
    end
  end

  def destroy
    like = current_user.destroy_like(params[:id])
    @product = Product.find_by(id: like.product_id)
    if like.destroy
      render 'destroy.js.erb'
    else
      flase.now[:alert] = "ライクの取り消しに失敗しました"
      redirect_to product_path(@product.id)
    end
  end
end
