# frozen_string_literal: true

module Posts
  class LikesController < ApplicationController
    def create
      authenticate_user!
      @post = Post.find(params[:post_id])
      @like = @post.likes.build(like_params)
      @like.user_id = current_user.id
      @like.save
      return unless @like.save

      redirect_to @post
    end

    def destroy
      authenticate_user!
      @post = Post.find(params[:post_id])
      @like = @post.likes.find(params[:id])
      @like.destroy if @like.user_id == current_user.id
      redirect_to @post
    end

    private

    def like_params
      params.permit(:user_id, :post_id, :_method)
    end
  end
end
