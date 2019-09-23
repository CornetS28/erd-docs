# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all.reject { |u| u == current_user }
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
  end
end
