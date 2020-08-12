class RelationshipsController < ApplicationController
  def create
    follow = Relationship.new(user_id: current_user.id, follow_id: params[:follow_id])
    follow.save
    redirect_to root_path
  end

  def destroy
    follow = Relationship.find(params[:id])
    follow.destroy
    redirect_to root_path
  end
end
