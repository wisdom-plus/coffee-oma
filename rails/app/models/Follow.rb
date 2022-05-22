class Follow
  def initialize(user,follower)
    @user = user
    @follower = follower
  end

  private

  attr_reader :user, :follower

  def follow(user:,follwer:)
    return if self == user

    new(user: user,follwer: follower).find_or_create_by(follow_id: user.id)
  end

  def unfollow(user:,follower:)
    relationship = user.relationships.find_by(follow_id: follower.id)
    relationship&.destroy
  end

  def folloing?(user:,follower:)
    user.followings.include?(follower)
  end

  def follow_user(user:,follower:)
    user.relationships.find_by(follow_id: follower.id)
  end
end
