class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_including?, only: %i[show]
  before_action :room_exists?, only: %i[create]

  def index
    @rooms = RoomDecorator.decorate_collection(Room.join_room_list(current_user))
  end

  def show
    @room = Room.find(params[:id]).decorate
    @message = Message.new
    @messages = Message.room_message(params[:id])
  end

  def new
    @q = current_user.followings.ransack(params[:q])
    @followings = @q.result(distinct: true)
  end

  def create
    room = Room.room_new(current_user.id, params[:user_id].to_i)
    if room.save
      redirect_to room_path(room.id), status: :see_other
    else
      # :nocov:
      redirect_to root_path, flash: { alert: t('.alert') }, status: :see_other
      # :nocov:
    end
  end

  private

    def check_including?
      room = Room.find(params[:id])
      return if room.join?(current_user.id)

      redirect_to root_path, flash: { alert: t('.alert') }, status: :see_other
    end

    def room_exists?
      room = Room.find_room(current_user.id, User.find(params[:user_id]).id)
      return if room.blank?

      redirect_to room_path(room.id), status: :see_other
    end
end
