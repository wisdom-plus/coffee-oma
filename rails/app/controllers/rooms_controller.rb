class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_including?, only: %i[show]

  def index
    @rooms = Room.join_room_list(current_user)
  end

  def new
    @followings = current_user.followings
    @room = Room.new(participant1_id: current_user.id)
  end

  def create
    room = Room.room_new(current_user.id, params[:user_id].to_i)
    if room.save
      redirect_to room_path(room.id)
    else
      # :nocov:
      redirect_to root_path, flash: { alert: t('.alert') }
      # :nocov:
    end
  end

  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = Message.room_message(params[:id])
  end

  private

    def check_including?
      room = Room.find(params[:id])
      return if room.join?(current_user.id)

      redirect_to root_path, flash: { alert: t('.alert') }
    end
end
