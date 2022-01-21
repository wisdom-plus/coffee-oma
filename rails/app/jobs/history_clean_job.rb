class HistoryCleanJob < ApplicationJob
  queue_as :default

  def perform
    puts 'OK'
  end
end
