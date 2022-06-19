module ProductsHelper
  def item_url_link(product)
    return if product.url.empty?

    link_to '商品を詳しく見る', product.url.to_s, class: ' circular ui red button'
  end
end
