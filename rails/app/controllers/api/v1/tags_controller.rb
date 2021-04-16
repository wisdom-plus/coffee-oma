class Api::V1::TagsController < ApplicationController

  def index
    @tags = Tag.tag_search(params[:keyword])
  end
end
