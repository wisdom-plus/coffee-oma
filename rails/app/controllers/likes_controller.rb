class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def index
    @rankings = Product.all.order('likes_count desc').limit(INDEX_DISPALY_NUM)
  end

  def create
    if params[:type] == 'Product'
      @like = current_user.create_like(params[:type],params[:liked_id])
    elsif params[:type] == 'Bean'
      @like = current_user.create_like(params[:type],params[:liked_id])
    end
    render 'create.js.erb'
  end

  def destroy
    if params[:type] == 'ProductLike'
      like = current_user.destroy_product_like(params[:id])
      @liked = Product.find_by(id: like.liked_id)
    elsif params[:type] == 'BeanLike'
      like = current_user.destroy_bean_like(params[:id])
      @liked = Bean.find_by(id: like.liked_id)
    end
    render 'destroy.js.erb'
  end
end
