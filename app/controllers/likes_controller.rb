class LikesController < ApplicationController
  def create
    like = Like.new(user_id: current_user.id, product_id: params[:product_id])
    like.save
    redirect_to product_path(params[:product_id])
  end

  def destroy
    like = Like.find_by(id: params[:id])
    like.destroy
    redirect_to products_path
  end


end
