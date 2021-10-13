class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_including, only: %i[show]

  def index
    @rooms = Room.join_room_list(current_user)
  end

  def create
    room = Room.room_new(current_user.id, params[:user_id])
    if room.save
      redirect_to room_path(room.id)
    else
      redirect_to root_path, flash: { alret: 'エラーが発生しました。' }
    end
  end

  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = Message.room_message(params[:id])
  end

  private

    def check_including
      room = Room.find(params[:id])
      return if room.is_join?(current_user.id)

      redirect_to root_path, flash: { alert: '参加しているルームではないので、参加できませんでした' }
    end
end
