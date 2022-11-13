class HistoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @histories = current_user.histories.includes(bean: [:thread_image], product: [:thread_image]).sort_by_updated.page(params[:page]).per(9)
    @histories = HistoryDecorator.decorate_collection(@histories)
  end
end
