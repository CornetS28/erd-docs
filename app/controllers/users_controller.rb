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

  def self.new_with_session(params, session)
    super.tap do |user|
      if data == session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end
end
