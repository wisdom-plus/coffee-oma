class NotificationDecorator < ApplicationDecorator
  delegate_all
  include ActionView::Helpers::DateHelper

  def class_name
    source.class.name
  end

  def product_review_like?
    class_name == 'ProductReviewLike'
  end

  def bean_review_like?
    class_name == 'BeanReviewLike'
  end

  delegate :id, to: :sender, prefix: true

  def sender_name
    sender.username
  end

  def sender_icon
    sender.icon.url
  end

  delegate :room_id, to: :source

  delegate :liked_id, to: :source

  def bean_id
    source.bean_review.bean_id
  end

  def product_id
    source.review.product_id
  end

  def review_content
    if product_review_like?
      source.review.content
    elsif bean_review_like?
      source.bean_review.content
    end
  end

  def created_ago
    time_ago_in_words(created_at)
  end
end
