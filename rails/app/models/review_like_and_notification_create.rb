class ReviewLikeAndNotificationCreate
# review_likeとnotificationを作成するクラス

  def initialize(user, type, liked_id)
    @user = user
    @type = type
    @liked_id = liked_id
  end

  def create
    review_like = @user.likes.find_or_create_by(liked_id: @liked_id, type: @type)
    review = review_like.accociated_review
    create_notification(review_like, review.user)
    review_like
  end

  private

    def create_notification(review_like, user)
      notification = Notification.new(source: review_like, user: user)
      notification.save
    end
end
