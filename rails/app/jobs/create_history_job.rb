class CreateHistoryJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: 3

  def perform(user_id, params)
    user = User.find(user_id)
    user.create_or_update_history(params)
  end
end
