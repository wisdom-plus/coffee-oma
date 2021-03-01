class DeleteReviewJob < ApplicationJob
  queue_as :default

  def perform(delete_review_id)
    review = Review.find(delete_review_id)
    review.destroy
  end
end
