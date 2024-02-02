# frozen_string_literal: true

module Posts
  class LikesController < ApplicationController
    def create
      authenticate_user!
      @post = Post.find(params[:post_id])
      @like = @post.likes.find_or_create_by(user_id: current_user.id)
      redirect_to @post
    end

    def destroy
      authenticate_user!
      @post = Post.find(params[:post_id])
      @like = @post.likes.find(params[:id])
      @like.destroy if @like.user_id == current_user.id
      redirect_to @post
    end
  end
end
