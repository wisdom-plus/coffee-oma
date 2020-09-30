class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = current_user.create_like(params[:product_id])
    render 'create.js.erb'
  end

  def destroy
    like = current_user.destroy_like(params[:id])
    @product = Product.find_by(id: like.product_id)
    render 'destroy.js.erb'
  end
end
