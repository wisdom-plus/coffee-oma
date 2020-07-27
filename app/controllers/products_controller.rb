class ProductsController < ApplicationController
  def search
    if params[:keyword]
      @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword],imageFlag: 1, elements: "itemName")
    end
    redirect_to action: "index"
  end

  def new

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
end
