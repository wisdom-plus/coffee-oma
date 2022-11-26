# frozen_string_literal: true

class Message::Component < ViewComponent::Base
  with_collection_parameter :message

  def initialize(message:, current_user:)
    @message = message
    @current_user = current_user
  end

  def message_user_icon
    @message.user.icon.url
  end

  def render?
    @message.present?
  end
end
