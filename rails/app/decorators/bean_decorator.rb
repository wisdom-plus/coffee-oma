class BeanDecorator < ApplicationDecorator
  delegate_all

  def reviews_evaluations
    bean_reviews.evaluations
  end
end
