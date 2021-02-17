class HistoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @histories = current_user.histories.includes([:bean, :product]).order(updated_at: :DESC)

  end
end
