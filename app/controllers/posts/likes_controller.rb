# frozen_string_literal: true

module Posts
  class LikesController < ApplicationController
    before_action :set_post
    before_action :authenticate_user!

    def create
      @like = @post.likes.build(like_params)
      @like.user_id = current_user.id
      @like.save
      return unless @like.save

      redirect_to @post
    end

    def destroy
      @like = @post.likes.find(params[:id])
      @like.destroy if @like.user_id == current_user.id
      redirect_to @post
    end

    private

    def like_params
      params.permit(:user_id, :post_id, :_method)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
  end
end
