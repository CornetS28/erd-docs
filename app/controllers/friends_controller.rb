class FriendsController < ApplicationController
  before_action :authenticate_user!
  def index
    @friends = current_user.friends
    @requests = current_user.friend_requests
  end

  def create
    @friend = Friend.new(user_id: current_user.id, friend_id: params[:friend_id], status: false)
    @friend.save
    redirect_back(fallback_location: root_path)
  end

  def accept
    @user = Friend.find_by(user_id: params[:friend_id], friend_id: current_user.id)
    @user.status = true
    @friend = Friend.new(user_id: current_user.id, friend_id: params[:friend_id], status: true)
    @user.save && @friend.save
    redirect_back(fallback_location: root_path)
  end

  private

  def friend_param
    params.require(:friend_id).permit
  end
end
