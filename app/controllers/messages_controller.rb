class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    message = Message.new(message_params)
    message.save
    redirect_to room_path(message.room_id)
  end

  private

    def message_params
      params.require(:message).permit(:message, :user_id, :room_id)
    end
end
