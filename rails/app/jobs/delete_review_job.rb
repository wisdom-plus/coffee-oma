class DeleteReviewJob < ApplicationJob
  queue_as :default

  def perform(review_id)
    review = Review.find(review_id)
    review.destroy
  end
end
