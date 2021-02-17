class HistoriesController < ApplicationController
  def index
    @histories = current_user.histories.includes([:bean, :product]).order(updated_at: :DESC)

  end
end
