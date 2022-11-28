# frozen_string_literal: true

class ReviewForm::Component < ViewComponent::Base
  def initialize(review:, product_id:, current_user:)
    super
    @review = review
    @product_id = product_id
    @current_user = current_user
  end

  def user_signed_in?
    @current_user.present?
  end
end
