class NotificationsController < ApplicationController
  before_action :authenticate_user!
  after_action -> { Notification.checked_notifications(current_user.id) }

  def index
    @notifications = current_user.notifications.includes(:source).limit(25).history_order
    @follow_notifications = @notifications.type_filter('Relationship')
    @like_notifications = @notifications.type_filter('Like')
    @message_notifications = @notifications.type_filter('Message')
    notification_include(@notifications)
    # review_like_include(@bean_review_like_notifications)
    # bean_review_like_include(@product_review_like_notifications)
  end

  private

    def notification_include(likes)
      preloader = ActiveRecord::Associations::Preloader.new
      preloader.preload(likes.select { |i| i.source.class.name == 'BeanReviewLike' }, source: [:bean_review,:user])
      preloader.preload(likes.select { |i| i.source.class.name == 'ProductReviewLike' }, source: [:review,:user])
    end

    def review_like_include(likes)
      preloader = ActiveRecord::Associations::Preloader.new
      preloader.preload(likes.select { |i| i.source == 'BeanReviewLike' }, like: :bean_review)
    end

    def bean_review_like_include(likes)
      preloader = ActiveRecord::Associations::Preloader.new
      preloader.preload(likes.select { |i| i.source_type == 'ProductReviewLike' }, like: :review)
    end
end
