module Follow
  extend ActiveSupport::Concern

  included do
    has_many :relationships, dependent: :destroy
    has_many :followings, through: :relationships, source: :follow
    has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy, inverse_of: 'user'
    has_many :followers, through: :reverse_of_relationships, source: :user
  end

  def follow(other_user)
    return if self == other_user

    relationships.find_or_create_by(follow_id: other_user.id)
  end

  def unfollow(other_user_id)
    relationship = relationships.find_by(follow_id: other_user_id)
    relationship&.destroy
  end

  def following?(other_user)
    followings.include?(other_user)
  end

  def follow_user(other_user)
    relationships.find_by(follow_id: other_user.id)
  end

end
