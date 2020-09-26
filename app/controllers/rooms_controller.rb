class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_including, only: %i[show]

  def index
    @rooms = Room.where("participant1_id = ? or participant2_id = ?", current_user.id, current_user)
  end

  def create
    if current_user.id > params[:user_id].to_i
      room = Room.new(participant1_id: params[:user_id],participant2_id: current_user.id )
    else
      room = Room.new(participant1_id: current_user.id, participant2_id: params[:user_id])
    end
    room.save
    redirect_to room_path(room.id)
  end

  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = Message.where(room_id: params[:id])
  end

  private

  def check_including
    room = Room.find(params[:id])
    if room.participant1_id == current_user.id || room.participant2_id == current_user.id
    else
      redirect_to root_path, flash: {alret: "参加できませんでした"}
    end
  end
end
