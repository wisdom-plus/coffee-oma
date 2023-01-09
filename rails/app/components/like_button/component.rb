# frozen_string_literal: true

class LikeButton::Component < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(like:, liked:)
    super
    @like = like
    @liked = liked
  end
end
