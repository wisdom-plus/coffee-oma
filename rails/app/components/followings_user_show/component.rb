# frozen_string_literal: true

class FollowingsUserShow::Component < ViewComponent::Base

  def initialize(followings:)
    @followings = followings
  end
end
