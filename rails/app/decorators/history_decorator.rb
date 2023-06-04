class HistoryDecorator < ApplicationDecorator
  delegate_all

  delegate :id, to: :product, prefix: true
  delegate :name, to: :product, prefix: true

  delegate :id, to: :bean, prefix: true
  delegate :name, to: :bean, prefix: true
  delegate :country, to: :bean, prefix: true
  delegate :roast, to: :bean, prefix: true

  def product_shop
    return 'なし' if product.brand.blank?

    product.brand.name
  end

  def caption_truncate(limit = 50)
    product.caption.truncate(limit)
  end

  def description_truncate(limit = 50)
    bean.description.truncate(limit)
  end

  def product?
    history.product_id.present?
  end

  def bean?
    history.bean_id.present?
  end

  def product_images(num = 0)
    product.images[num].url
  end

  def bean_images(num = 0)
    bean.images[num].url
  end
end
