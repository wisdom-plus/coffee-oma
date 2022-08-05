class ReviewLikeAndNotificationCreate
# review_likeとnotificationを作成するクラス

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
    create_notification(review_like, review.user)
    review_like
  end

  private

    def create_notification(review_like, user)
      notification = Notification.new(source: review_like, user: user)
      notification.save
    end
end
