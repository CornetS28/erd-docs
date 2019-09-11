# frozen_string_literal: true

class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :check_post, only: %i[show edit destroy update]
    before_action only: %i[update edit destroy] do
      owner?(@post.author)
    end
  
    def index
      @post = Post.new
      @posts = current_user.posts
      current_user.find_friends.each { |user| @posts += user.posts }
      @posts = @posts.sort { |a, b| b.created_at - a.created_at } unless @posts.empty?
    end
  
    def new
      @post = Post.new
    end
  
    def create
      user = current_user
      @post = user.posts.build(post_params)
      if @post.save
        redirect_to root_path
      else
        render :new
      end
    end
  
    def show
      @new_comment = Comment.new
      @comments = @post.comments
      @comments = @comments.sort { |a, b| a.created_at - b.created_at } unless @comments.empty?
    end
  
    def edit; end
  
    def update
      if @post.update_attributes(post_params)
        redirect_to post_path(@post)
      else
        render :edit
      end
    end
  
    def destroy
      @post.destroy
      redirect_to root_path
    end
  
    private
  
    def post_params
      params.require(:post).permit(:content)
    end
  
    def check_post
      @post = Post.find(params[:id])
    end
  end