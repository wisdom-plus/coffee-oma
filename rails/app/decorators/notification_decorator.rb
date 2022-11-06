class NotificationDecorator < ApplicationDecorator
  delegate_all
  include ActionView::Helpers::DateHelper 

  def class_name
    self.source.class.name
  end
 
  def class_product_review?
    class_name === "ProductReviewLike"
  end

  def class_bean_review?
    class_name === "BeanReviewLike"
  end

  def sender_id
    self.sender.id
  end

  def sender_name
    self.sender.username
  end

  def sender_icon
    self.sender.icon.url
  end

  def room_id
    self.source.room_id
  end

  def liked_id
    self.source.liked_id
  end

  def review_content
    if class_product_review? 
      self.source.review.content
    elsif class_bean_review?
      self.course.bean_review.content
    end
  end

  def created_ago
    time_ago_in_words(self.created_at)
  end

end
