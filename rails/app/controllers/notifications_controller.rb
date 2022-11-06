class NotificationsController < ApplicationController
  before_action :authenticate_user!
  after_action -> { Notification.checked_notifications(current_user.id) }

  def index
    @notifications = current_user.notifications.includes(source: :user).limit(25).history_order
    @follow_notifications = @notifications.type_filter('Relationship')
    @like_notifications = @notifications.type_filter('Like')
    @message_notifications = @notifications.type_filter('Message')
    notification_include(@notifications)
    session[:checked] = false if session[:checked]
    @notifications= NotificationDecorator.decorate_collection(@notifications)
  end

  private

    def notification_include(likes)
      preloader = ActiveRecord::Associations::Preloader.new
      preloader.preload(likes.select { |i| i.source.instance_of?(BeanReviewLike) }, source: %i[bean_review user])
      preloader.preload(likes.select { |i| i.source.instance_of?(ProductReviewLike) }, source: %i[review user])
    end
end
