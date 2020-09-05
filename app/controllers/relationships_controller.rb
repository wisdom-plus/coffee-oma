class RelationshipsController < ApplicationController
  def create
    @follow = Relationship.new(user_id: current_user.id, follow_id: params[:follow_id]) unless current_user.id == params[:follow_id]
    @follow.save
    @user = User.find(params[:follow_id])
  end

  def destroy
    @follow = Relationship.find(params[:id])
    @user = User.find(@follow.follow_id)
    @follow.destroy
  end
end
