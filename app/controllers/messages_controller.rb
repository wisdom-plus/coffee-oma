class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    message = current_user.messages.new(message_params)
    message.save
    redirect_to room_path(message.room_id)
  end

  private

    def message_params
      params.require(:message).permit(:message).merge(room_id: params[:room_id])
    end
end
