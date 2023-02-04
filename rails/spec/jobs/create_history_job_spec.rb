require 'rails_helper'

RSpec.describe 'create_history' do
  let(:user) { create(:user) }
  let(:product) { create(:product, user: user) }

  describe '#perform_later' do
    it 'enqueue job' do
      ActiveJob::Base.queue_adapter = :test
      CreateHistoryJob.perform_later(user.id, { controller: 'products', id: product.id })
      expect(CreateHistoryJob).to have_been_enqueued
    end

    it 'create history' do
      ActiveJob::Base.queue_adapter = :test
      expect do
        CreateHistoryJob.perform_now(user.id, { controller: 'products', id: product.id })
      end.to change(History, :count).by 1
    end
  end
end
