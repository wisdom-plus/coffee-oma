module ProductsHelper
  def item_url_link(product)
    unless product.itemurl.empty?
      link_to "商品を詳しく見る","#{product.itemurl}",class: " circular ui red button"
    end
  end
end
