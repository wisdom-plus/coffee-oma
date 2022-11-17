class HistoryCleanJob < ApplicationJob
  queue_as :high_priority
  sidekiq_options retry: 3

  def perform
    User.includes(:histories).find_each do |user|
      user.histories.where('updated_at < ?', 1.week.ago).in_batches do |histories|
        if histories.size >= 20
          histories.destroy_all
        end
      end
    end
  end
end
