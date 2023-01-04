class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def index
    @rankings = Product.includes(:thread_image).ranking_index
    @rankings = ProductDecorator.decorate_collection(@rankings)
  end

  def create
    case params[:type]
    when 'Product'
      @like = current_user.product_likes.find_or_create_by(liked_id: params[:liked_id])
      @liked = Product.find_by(id: params[:liked_id]).decorate
    when 'Bean'
      @like = current_user.bean_likes.find_or_create_by(liked_id: params[:liked_id])
      @liked = Bean.find_by(id: params[:liked_id]).decorate
    end
    @liked.reload
    respond_to do |format|
      format.js
      format.html { redirect_to root_path, status: :see_other }
    end
  end

  def destroy
    case params[:type]
    when 'ProductLike'
      like = current_user.product_likes.find_by(id: params[:id])
      @liked = Product.find_by(id: like.liked_id).decorate
    when 'BeanLike'
      like = current_user.bean_likes.find_by(id: params[:id])
      @liked = Bean.find_by(id: like.liked_id).decorate
    end
    like&.destroy unless like.nil?
    @liked.reload
    respond_to do |format|
      format.js
      format.html { redirect_to root_path, status: :see_other }
    end
  end
end
