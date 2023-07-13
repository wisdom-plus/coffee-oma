# frozen_string_literal: true

class FollowingsUserShow::Component < ViewComponent::Base
  def initialize(followings:)
    @followings = followings
    super
  end
end
