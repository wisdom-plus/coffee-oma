class Component::NotificationsController < Component::ApplicationController
  def bell
    render turbo_stream: turbo_stream_component_replace('notification_bell', checked: session[:checked])
  end
end
