class Component::ReviewsController < Component::ApplicationController
  def home
    @reviews = ReviewDecorator.decorate_collection(Review.latest_review)

    render turbo_stream: turbo_stream_component_replace('home_reviews', reviews: @reviews)
  end
end
