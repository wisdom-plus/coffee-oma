class ReviewLikeAndNotificationCreate
# review_likeとnotificationを作成する

  def initialize(user,type,liked_id)
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
    create_notification(@user,review.user_id)
    return review_like,review
  end

  private

  def create_notification(like_id,user_id)
    @user.active_notifications.new(like_id: like_id, visited_id: user_id, action: 'like')
  end
end
