# frozen_string_literal: true

class LikeButton::Component < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(like:, liked:, signed_in:)
    super
    @like = like
    @liked = liked
    @signed_in = signed_in
  end
end
