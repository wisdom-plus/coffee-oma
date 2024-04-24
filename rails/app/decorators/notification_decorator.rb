class NotificationDecorator < ApplicationDecorator
  delegate_all
  include ActionView::Helpers::DateHelper
  include Rails.application.routes.url_helpers

  def class_name
    source.class.name
  end

  def product_review_like?
    source.is_a?(ProductReviewLike)
  end

  def bean_review_like?
    source.is_a?(BeanReviewLike)
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

  def like_source_path
    if product_review_like?
      product_path(product_id)
    elsif bean_review_like?
      bean_path(bean_id)
    end
  end
end
