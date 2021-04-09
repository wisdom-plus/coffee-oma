class TagsController < ApplicationController
  before_action :authenticate_user!

  def update
    case params[:type]
    when 'Product'
      product = Product.find(params[:id])
      product.tag_list.add(params[:tag_list],parse: true)
      if product.save
        redirect_to product_path(params[:id])
      else
        render product_path(params[:id])
      end
    when 'Bean'
      bean = Bean.find(params[:id])
      bean.tag_list.add(params[:tag_list],parse: true)
      if bean.save
        refirect_to bean_path(params[:id])
      else
        render bean_path(params[:id])
      end
    end
  end
end
