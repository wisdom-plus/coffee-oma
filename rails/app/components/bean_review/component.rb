# frozen_string_literal: true

class BeanReview::Component < ViewComponent::Base
  with_collection_parameter :review

  def initialize(review:, review_likes:, current_user:)
    super
    @review = review
    @review_likes = review_likes
    @current_user = current_user
  end

  def user_signed_in?
    @current_user.present?
  end
end
