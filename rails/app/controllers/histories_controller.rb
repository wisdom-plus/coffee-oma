class HistoriesController < ApplicationController
  def index
    @histories = current_user.histories.order(updated_at: :DESC)

  end
end
