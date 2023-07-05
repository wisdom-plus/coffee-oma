# frozen_string_literal: true

class ReviewForm::Component < ViewComponent::Base
  def initialize(review:, product_id:)
    super
    @review = review
    @product_id = product_id
  end
end
