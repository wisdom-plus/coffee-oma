# frozen_string_literal: true

class ReviewsUserShow::Component < ViewComponent::Base
  def initialize(reviews:)
    @reviews = reviews
    super
  end
end
