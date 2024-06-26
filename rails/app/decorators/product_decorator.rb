class ProductDecorator < ApplicationDecorator
  delegate_all

  def rate_average_num
    if reviews_count.zero?
      return 0
    end

    (rate_average * 2).floor / 2.to_f
  end

  def rate_average
    if reviews_count.zero?
      return 0
    end

    (rate_sum.to_f / reviews_count).floor(1)
  end

  def image_url(num = 0)
    images[num].url
  end

  def price_delimited
    price.to_fs(:delimited)
  end

  def like_class
    'ProductLike'
  end

  def base_class
    'Product'
  end

  def brand_name
    return 'なし' if brand.blank?

    brand.name
  end
end
