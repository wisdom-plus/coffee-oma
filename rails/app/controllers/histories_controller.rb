class HistoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @histories = current_user.histories.includes(%i[bean product]).sort_by_updated.page(params[:page]).per(9)
    @histories = HistoryDecorator.decorate_collection(@histories)
  end
end
