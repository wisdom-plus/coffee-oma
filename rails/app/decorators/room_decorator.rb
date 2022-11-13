class RoomDecorator < ApplicationDecorator
  delegate_all

  def another_user_name(current_user)
    another_user(current_user).username
  end

  def another_user_icon(current_user)
    another_user(current_user).icon
  end

  def letest_message_created_at
    messages.last.created_at
  end

  def letest_message
    messages.last.message
  end
end
