 class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def index
    @rankings = Product.all.order('likes_count desc').limit(INDEX_DISPALY_NUM)
  end

  def create
    case params[:type]
    when 'Product'
      @like = current_user.create_like(params[:type], params[:liked_id])
    when 'Bean'
      @like = current_user.create_like(params[:type], params[:liked_id])
    end
    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end

  def destroy
    case params[:type]
    when 'ProductLike'
      like = current_user.destroy_like(params[:type], params[:id])
      @liked = Product.find_by(id: like.liked_id)
    when 'BeanLike'
      like = current_user.destroy_like(params[:type], params[:id])
      @liked = Bean.find_by(id: like.liked_id)
    end
    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end
end
