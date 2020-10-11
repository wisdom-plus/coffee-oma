class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message = current_user.messages.new(message_params)
    return unless @message.save

    @messages = Message.where('room_id = ?', params[:room_id])
    @message.create_notification_message(current_user)
    ActionCable.server.broadcast("room_channel_#{@message.room_id}",
                                 message: @message.message.gsub(/\r\n|\r|\n/, "<br>"),
                                 user_id: current_user.id,
                                 iconurl: @message.user.icon.url,
                                 time: @message.created_at.strftime('%H:%M'))
  end

  private

    def message_params
      params.require(:message).permit(:message).merge(room_id: params[:room_id])
    end
end
