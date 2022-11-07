class BeanDecorator < ApplicationDecorator
  delegate_all

  def review_evaluations
    bean_reivws.evaluations
  end
end
