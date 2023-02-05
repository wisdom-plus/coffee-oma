require 'rails_helper'

RSpec.describe 'DeleteReviewJob' do
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }
  let(:review) { create(:review, user: user, product: product) }

  describe 'perform_later' do
    it 'enqueue job' do
      ActiveJob::Base.queue_adapter = :test
      DeleteReviewJob.perform_later(review)
      expect(DeleteReviewJob).to have_been_enqueued
    end

    it 'delete review' do
      ActiveJob::Base.queue_adapter = :test
      review
      expect do
        DeleteReviewJob.perform_now(review)
      end.to change(Review, :count).by(-1)
    end
  end
end
