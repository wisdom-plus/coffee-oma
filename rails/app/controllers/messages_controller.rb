class MessagesController < ApplicationController
  before_action :authenticate_user!
  after_action :message_notification
  def create
    @message = current_user.messages.new(message_params)
    return unless @message.save

    ActionCable.server.broadcast("room_channel_#{@message.room_id}",
                                 { message: @message.message.gsub(/\r\n|\r|\n/, '<br>'),
                                   user_id: current_user.id,
                                   iconurl: @message.user.icon.url,
                                   time: @message.created_at.strftime('%H:%M') })
  end

  private

    def message_params
      params.require(:message).permit(:message).merge(room_id: params[:room_id])
    end

    def message_notification
      @message.create_notification_message(current_user) if @message.save
    end
end
