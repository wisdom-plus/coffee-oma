class ProductsController < ApplicationController

  def new
    if params[:keyword]
      @items = rakuten_search(params[:keyword])
    end
  end

  def create

  end

  def destroy
  end

  def index

  end

  def update

  end

  def edit
  end

  def show

  end

  private

  def rakuten_search(search_keyword)
    RakutenWebService::Ichiba::Item.search(keyword: search_keyword,imageFlag: 1)
  end

end
