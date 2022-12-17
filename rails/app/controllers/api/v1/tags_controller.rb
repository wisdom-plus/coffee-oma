class Api::V1::TagsController < ApplicationController
  def index
    return nil unless params[:keyword].present?

    @tags = Tag.tag_search(params[:keyword])
    unless @tags.present?
      @tags = [Tag.new(name: params[:keyword])]
    end
  end
end
