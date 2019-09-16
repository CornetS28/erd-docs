# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = Comment.new(user_id: current_user.id, post_id: params[:post_id], comment: params[:comment])
    @comment.save
    redirect_back(fallback_location: root_path)
  end
end
