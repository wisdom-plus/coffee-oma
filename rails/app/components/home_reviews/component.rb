# frozen_string_literal: true

class HomeReviews::Component < ViewComponent::Base
  def initialize(reviews:)
    @reviews = reviews
  end
end
