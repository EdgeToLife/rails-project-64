# frozen_string_literal: true

class PostsController < ApplicationController
  # GET /posts or /posts.json
  def index
    @posts = Post.includes(:creator).order('created_at')
  end

  # GET /posts/1 or /posts/1.json
  def show
    @post = Post.includes(:comments, :likes).order('post_comments.created_at').find(params[:id])
    @comment = PostComment.new
  end

  # GET /posts/new
  def new
    authenticate_user!
    @post = current_user.posts.build
  end

  # POST /posts
  def create
    authenticate_user!
    @categories = Category.all
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: t('.create_success') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id, :creator_id)
  end
end
