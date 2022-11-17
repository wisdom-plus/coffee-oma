class DeleteReviewJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: 3

  def perform(review)
    review.destroy
  end
end
