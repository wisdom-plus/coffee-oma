class Component::RelationshipsController < Component::ApplicationController
  def followings_user_show
    @user = User.find_by(id: params[:user_id])
    @followings = @user.followings

    render turbo_stream: turbo_stream_component_replace('followings_user_show', followings: @followings)
  end

  def followers_user_show
    @user = User.find_by(id: params[:user_id])
    @followers = @user.followers

    render turbo_stream: turbo_stream_component_replace('followers_user_show', followers: @followers)
  end
end
