class BeanReviewDecorator < ApplicationDecorator
  delegate_all

  delegate :name, to: :bean, prefix: true

  delegate :icon, to: :user, prefix: true

  def user_name
    user.username
  end

  def base_class
    'BeanReview'
  end
end
