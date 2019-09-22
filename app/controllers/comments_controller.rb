# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @comment = Comment.new(comment_param)
    @comment.save
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_param
    params.permit(:post_id, :user_id, :comment)
  end
end
