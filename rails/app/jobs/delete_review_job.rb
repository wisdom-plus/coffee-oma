class DeleteReviewJob < ApplicationJob
  queue_as :default

  def perform(review)
    review.destroy
  end
end
