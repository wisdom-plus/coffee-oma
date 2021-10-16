module ProductsHelper
  def item_url_link(product)
    return if product.itemurl.empty?

    link_to '商品を詳しく見る', product.itemurl.to_s, class: ' circular ui red button'
  end
end
