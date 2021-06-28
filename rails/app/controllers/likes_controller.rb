class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def index
    @rankings = Product.ranking_index
  end

  def create
    @like = case params[:type]
            when 'Product'
              current_user.product_likes.find_or_create_by(liked_id: params[:liked_id])
            when 'Bean'
              current_user.bean_likes.find_or_create_by(liked_id: params[:liked_id])
            end
    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end

  def destroy
    case params[:type]
    when 'ProductLike'
      like = current_user.product_likes.find_by(id: params[:id])
      @liked = Product.find_by(id: like.liked_id)
    when 'BeanLike'
      like = current_user.bean_likes.find_by(id: params[:id])
      @liked = Bean.find_by(id: like.liked_id)
    end
    like&.destroy unless like.nil?
    respond_to do |format|
      format.js
      format.html { redirect_to root_path }
    end
  end
end
