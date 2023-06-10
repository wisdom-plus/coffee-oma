class Component::LikesController < Component::ApplicationController
  def home
    @rankings = Product.includes(%i[thread_image brand]).like_top

    render turbo_stream: turbo_stream_component_replace('home_ranking', rankings: @rankings)
  end
end
