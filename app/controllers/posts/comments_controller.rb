# frozen_string_literal: true

module Posts
  class CommentsController < Posts::ApplicationController
    before_action :set_comment, only: %i[show edit update destroy]
    before_action :set_post, only: %i[index new create]
    before_action :authenticate_user!, only: %i[create destroy]

    # GET /comments
    def index
      @comments = Comment.arrange(order: :created_at)
    end

    # GET /comments/1 or /comments/1.json
    def show; end

    # GET /comments/new
    def new
      @comment = @post.comments.build
    end

    # GET /comments/1/edit
    def edit; end

    # POST /comments
    def create
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

    # PATCH/PUT /comments/1
    def update
      respond_to do |format|
        if @comment.update(comment_params)
          format.html { redirect_to post_path(@comment.post), notice: t('.update_success') }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /comments/1
    def destroy
      @comment.destroy!

      respond_to do |format|
        format.html { redirect_to comments_url, notice: t('.destroy_success') }
      end
    end

    private

    def set_comment
      @comment = PostComment.find(params[:id])
    end

    def comment_params
      params.require(:post_comment).permit(:content, :post_id, :user_id, :parent_id)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
  end
end
