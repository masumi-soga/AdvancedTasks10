class RelationshipsController < ApplicationController

  def create
    current_user.follow(params[:id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:id])
    redirect_to request.referer
  end

  def follow_list
    @user = User.find(params[:id])
  end

  def follower_list
    @user = User.find(params[:id])
  end

end
