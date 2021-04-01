class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_including, only: %i[show]

  def index
    @rooms = Room.includes([:participant1], [:participant2]).where('participant1_id = ? or participant2_id = ?', current_user.id, current_user)
  end

  def create
    room = if current_user.id > params[:user_id].to_i
             Room.new(participant1_id: params[:user_id], participant2_id: current_user.id)
           else
             Room.new(participant1_id: current_user.id, participant2_id: params[:user_id])
           end
    room.save
    redirect_to room_path(room.id)
  end

  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = Message.includes([:user]).where('room_id = ?', params[:id])
  end

  private

    def check_including
      room = Room.find(params[:id])
      return if room.participant1_id == current_user.id || room.participant2_id == current_user.id

      redirect_to root_path, flash: { alret: '参加できませんでした' }
    end
end
