class Api::V1::TagsController < ApplicationController
  def index
    @tags = Tag.tag_search(params[:keyword]) if params[:keyword].present?
  end
end
