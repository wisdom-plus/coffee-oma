class BeanDecorator < ApplicationDecorator
  delegate_all

  def reviews_evaluations
    bean_reviews.evaluations
  end

  def like_class
    'BeanLike'
  end

  def base_class
    'Bean'
  end
end
