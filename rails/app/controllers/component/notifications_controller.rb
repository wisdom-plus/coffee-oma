class Component::NotificationsController < Component::ApplicationController
  def bell
    render turbo_stream: turbo_stream_component_replace('notification_bell', checked: session[:checked])
  end

  def follow
    @notifications = current_user.notifications.includes(source: :user).limit(25).history_order
    notification_include(@notifications)
    filter_notifications(@notifications, 'Relationship')

    render turbo_stream: turbo_stream_component_replace('follow_notification', notifications: @notifications)
  end

  def like
    @notifications = current_user.notifications.includes(source: :user).limit(25).history_order
    notification_include(@notifications)
    filter_notifications(@notifications, 'Like')

    render turbo_stream: turbo_stream_component_replace('like_notification', notifications: @notifications)
  end

  def message
    @notifications = current_user.notifications.includes(source: :user).limit(25).history_order
    notification_include(@notifications)
    filter_notifications(@notifications, 'Message')

    render turbo_stream: turbo_stream_component_replace('message_notification', notifications: @notifications)
  end

  private

    def notification_include(likes)
      ActiveRecord::Associations::Preloader.new(records: likes, associations: %i[bean_review_like product_review_like])
      # preloader.preload(likes.select { |i| i.source.instance_of?(BeanReviewLike) }, source: %i[bean_review user])
      # preloader.preload(likes.select { |i| i.source.instance_of?(ProductReviewLike) }, source: %i[review user])
    end

    def filter_notifications(notifications, target_class)
      notifications.select { |n| n.source_type == target_class }
    end
end
