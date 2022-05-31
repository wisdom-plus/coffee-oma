class ReviewLikeAndNotificationCreate
# review_likeとnotificationを作成する

  def initialize(user, type, liked_id)
    @user = user
    @type = type
    @liked_id = liked_id
  end

  def create
    case @type
    when 'Review'
      review_like = @user.product_review_likes.find_or_create_by(liked_id: @liked_id)
      review = Review.find(@liked_id)
    when 'BeanReview'
      review_like = @user.bean_review_likes.find_or_create_by(liked_id: @liked_id)
      review = BeanReview.find(@liked_id)
    end
    create_notification(review_like, review.user_id)
    review_like
  end

  private

    def create_notification(review_like, user_id)
      notification = @user.active_notifications.new(like_id: review_like.id, visited_id: user_id, action: review_like.class.name)
      notification.save
    end
end
