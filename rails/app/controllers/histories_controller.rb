class HistoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @histories = current_user.histories.related_history
end
