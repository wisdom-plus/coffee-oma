class NotificationsController < ApplicationController
  before_action :authenticate_user!
  after_action -> { Notification.checked_notifications(current_user.id) }

  def index
    @notifications = current_user.notifications.includes(:like, :message,:relationships).limit(25).history_order
    @follow_notifications = @notifications.type_filter('follow')
    @bean_review_like_notifications = @notifications.type_filter('BeanReviewLike')
    @product_review_like_notifications = @notifications.type_filter('ProductReviewLike')
    @message_notifications = @notifications.type_filter('message')
    notification_include(@notifications)
    review_like_include(@bean_review_like_notifications)
    bean_review_like_include(@product_review_like_notifications)
  end

  private

    def notification_include(likes)
      preloader = ActiveRecord::Associations::Preloader.new
      preloader.preload(likes.select { |i| i.action == 'BeanReviewLike' }, like: :bean_review)
      preloader.preload(likes.select { |i| i.action == 'ProductReviewLike' }, like: :review)
    end

    def review_like_include(likes)
      preloader = ActiveRecord::Associations::Preloader.new
      preloader.preload(likes.select { |i| i.action == 'BeanReviewLike' }, like: :bean_review)
    end

    def bean_review_like_include(likes)
      preloader = ActiveRecord::Associations::Preloader.new
      preloader.preload(likes.select { |i| i.action == 'ProductReviewLike' }, like: :review)
    end
end
