class LikesController < ApplicationController
  include TurboStreamComponent
  before_action :authenticate_user!, only: %i[create destroy]

  def index
    @rankings = Product.includes(:thread_image, :brand).ranking_index
    @rankings = ProductDecorator.decorate_collection(@rankings)
  end

  def create
    @like = get_like(params[:type], params[:liked_id])
    @liked = get_liked(params[:type], params[:liked_id])
    @liked.reload
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream_component_replace('like_button', like: @like, liked: @liked, signed_in: true)
      end
      format.html { redirect_to root_path, status: :see_other }
    end
  end

  def destroy
    @like = get_destroy_like(params[:type], params[:id])
    @liked = get_liked(params[:type], @like.liked_id)
    @like&.destroy
    @liked.reload
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream_component_replace('like_button', like: nil, liked: @liked, signed_in: true)
      end
      format.html { redirect_to root_path, status: :see_other }
    end
  end

  private

    def get_like(type, params_id)
      if type == 'Product'
        current_user.product_likes.find_or_create_by(liked_id: params_id)
      else
        current_user.bean_likes.find_or_create_by(liked_id: params_id)
      end
    end

    def get_destroy_like(type, params_id)
      if type == 'Product'
        current_user.product_likes.find_by(id: params_id)
      else
        current_user.bean_likes.find_by(id: params_id)
      end
    end

    def get_liked(type, params_id)
      klass = type.constantize
      klass.find_by(id: params_id).decorate
    end
end
