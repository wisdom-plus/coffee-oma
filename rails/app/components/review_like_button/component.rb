# frozen_string_literal: true

class ReviewLikeButton::Component < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(review:, review_like:)
    super
    @review = review
    @review_like = review_like
  end
end
