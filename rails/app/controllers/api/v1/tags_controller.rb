class Api::V1::TagsController < ApplicationController
  def index
    return nil if params[:keyword].blank?

    @tags = Tag.tag_search(params[:keyword])
    return if @tags.present?

    @tags = [Tag.new(name: params[:keyword])]
  end
end
