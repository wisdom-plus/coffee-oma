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
end
