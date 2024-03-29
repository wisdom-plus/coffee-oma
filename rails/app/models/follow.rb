class Follow
  def initialize(user, follower)
    @user = user
    @follower = follower
  end

  def follow
    return if user == follower

    user.relationships.find_or_create_by(follow_id: follower.id)
  end

  def unfollow
    relationship = user.relationships.find_by(follow_id: follower.id)
    relationship&.destroy
  end

  def follow_user
    user.relationships.find_by(follow_id: follower.id)
  end

  private

    attr_reader :user, :follower
end
