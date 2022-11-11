class ReviewDecorator < ApplicationDecorator
  delegate_all

  delegate :name, to: :product, prefix: true

  def user_icon
    user.icon.url
  end

  def user_name
    user.username
  end

  def product_image
    product.images[0].url
  end

  def base_class
    'Review'
  end
end
