# frozen_string_literal: true

class PostsController < ApplicationController
  # GET /posts or /posts.json
  def index
    @posts = Post.includes(:creator).order('created_at DESC')
  end

  # GET /posts/1 or /posts/1.json
  def show
    @post = Post.find(params[:id])
    @like = (@post.likes.find_by(user_id: current_user.id) if user_signed_in?)
    @new_comment = PostComment.new
    @comments_tree = @post.comments.includes(:user).arrange(order: :created_at)
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

    if @post.save
      redirect_to post_url(@post), notice: t('.create_success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
