class HistoryCleanJob < ApplicationJob
  queue_as :default

  def perform
    User.includes(:histories).find_each do |user|
      user.histories.where('updated_at < ?', 1.week.ago).in_batches do |histories|
        if histories.size >= 45
          histories.destroy_all
        end
      end
    end
  end
end
