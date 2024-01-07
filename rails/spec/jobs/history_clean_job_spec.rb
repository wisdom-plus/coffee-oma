require 'rails_helper'

RSpec.describe 'HistoryCleanJob' do
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }
  let(:history) { create(:history, product: product, user: user) }

  describe 'perfore_later' do
    it 'enqueue job' do
      ActiveJob::Base.queue_adapter = :test
      HistoryCleanJob.perform_later
      expect(HistoryCleanJob).to have_been_enqueued
    end

    it 'history delete' do
      ActiveJob::Base.queue_adapter = :test
      create_list(:history, 10, product: product, user: user, updated_at: 2.weeks.ago)
      history
      expect do
        HistoryCleanJob.perform_now
      end.to change(History, :count).by(-10)
    end
  end
end
