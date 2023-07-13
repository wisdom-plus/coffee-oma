# frozen_string_literal: true

class FollowersUserShow::Component < ViewComponent::Base
  def initialize(followers:)
    @followers = followers
    super
  end
end
