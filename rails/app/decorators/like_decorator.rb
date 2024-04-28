class LikeDecorator < Draper::Decorator
  delegate_all
  include Rails.application.routes.url_helpers

  def like_source_path
    if type == 'ProductLike'
      product_path(liked_id)
    elsif type == 'BeanLike'
      bean_path(liked_id)
    end
  end

  def image_url
    if type == 'ProductLike'
      product.images[0].url
    elsif type == 'BeanLike'
      bean.images[0].url
    end
  end

  def name
    if type == 'ProductLike'
      product.name
    elsif type == 'BeanLike'
      bean.name
    end
  end
end
