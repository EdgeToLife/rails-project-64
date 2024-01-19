# frozen_string_literal: true

module Posts
  class CommentsController < Posts::ApplicationController
    # GET /comments
    def index
      @post = Post.find(params[:post_id])
      @comments = Comment.arrange(order: :created_at)
    end

    # GET /comments/new
    def new
      authenticate_user!
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build
    end

    # POST /comments
    def create
      authenticate_user!
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params)
      @comment.user_id = current_user.id
      @comment.parent_id = comment_params[:parent_id]

      respond_to do |format|
        if @comment.save
          format.html { redirect_to post_path(@comment.post), notice: t('.create_success') }
        else
          format.html { redirect_to post_path(@comment.post), notice: t('.create_error') }
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    private

    def comment_params
      params.require(:post_comment).permit(:content, :post_id, :user_id, :parent_id)
    end
  end
end
