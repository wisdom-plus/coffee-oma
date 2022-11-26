class NotificationsController < ApplicationController
  before_action :authenticate_user!, :checked
  after_action -> { Notification.checked_notifications(current_user.id) }

  def index
    @notifications = current_user.notifications.includes(source: :user).limit(25).history_order
    notification_include(@notifications)
    @notifications = NotificationDecorator.decorate_collection(@notifications)
  end

  private

    def notification_include(likes)
      preloader = ActiveRecord::Associations::Preloader.new
      preloader.preload(likes.select { |i| i.source.instance_of?(BeanReviewLike) }, source: %i[bean_review user])
      preloader.preload(likes.select { |i| i.source.instance_of?(ProductReviewLike) }, source: %i[review user])
    end

    def checked
      session[:checked] = false if session[:checked]
    end
end
