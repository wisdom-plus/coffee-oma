class HistoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @histories = current_user.histories.includes(%i[bean product]).sort_by_updated
  end
end
