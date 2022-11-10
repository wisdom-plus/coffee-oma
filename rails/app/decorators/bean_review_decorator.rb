class BeanReviewDecorator < ApplicationDecorator
  delegate_all

  delegate :name, to: :bean, prefix: true

  delegate :icon, to: :user, prefix: true

  def user_name
    user.username
  end

  def bean_image
    bean.images[0].url
  end

  def base_class
    'BeanReview'
  end
end
