class Component::LikesController < Component::ApplicationController
  def home
    @rankings = Product.includes(%i[thread_image brand]).like_top

    render turbo_stream: turbo_stream_component_replace('home_ranking', rankings: @rankings)
  end

  def user_show
    @user = User.find_by(id: params[:user_id])
    @likes = Like.find_product_and_bean(@user)

    render turbo_stream: turbo_stream_component_replace('likes_user_show', likes: @likes)
  end

  def product
    @product = Product.find_by(id: params[:liked_id]).decorate
    if user_signed_in?
      @like = current_user.product_likes.find_by(liked_id: params[:liked_id])
    end

    render turbo_stream: turbo_stream_component_replace('like_button', like: @like, liked: @product, signed_in: user_signed_in?)
  end

  def bean
    @bean = Bean.find_by(id: params[:liked_id]).decorate
    if user_signed_in?
      @like = current_user.bean_likes.find_by(liked_id: params[:liked_id])
    end

    render turbo_stream: turbo_stream_component_replace('like_button', like: @like, liked: @bean, signed_in: user_signed_in?)
  end
end
