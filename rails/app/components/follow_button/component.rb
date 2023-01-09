# frozen_string_literal: true

class FollowButton::Component < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(user:, follow:)
    super
    @user = user
    @follow = follow
  end
end
