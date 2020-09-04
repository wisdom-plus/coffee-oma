class LikesController < ApplicationController
  def create
    @like = Like.new(user_id: current_user.id, product_id: params[:product_id])
    @like.save


  end

  def destroy
    like = Like.find_by(id: params[:id])
    @product = Product.find_by(id: like.product_id)
    like.destroy
  end
end
