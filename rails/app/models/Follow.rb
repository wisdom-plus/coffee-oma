class Follow
  def initialize(user,follower)
    @user = user
    @follower = follower
  end

  private

  attr_reader :user, :follower

  def follow
    user.relationships.find_or_create_by(follow_id: user.id)
  end

  def unfollow
    relationship = user.relationships.find_by(follow_id: follower.id)
    relationship&.destroy
  end

  def folloing?
    user.followings.include?(follower)
  end

  def follow_user
    relationships.find_by(follow_id: follower.id)
  end
end
