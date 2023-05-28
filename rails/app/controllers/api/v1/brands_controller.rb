class Api::V1::TagsController < ApplicationController
  def index
    return nil if params[:keyword].blank?

    @brands = Brand.search(params[:keyword])
    return if @brands.present?

    @brands = [Brand.new(name: params[:keyword])]
  end
end
