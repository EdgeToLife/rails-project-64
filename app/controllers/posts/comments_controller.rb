class Posts::CommentsController < Posts::ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]
  before_action :set_post, only: %i[ index new create ]
  before_action :authenticate_user!, only: [:create]

  # GET /comments or /comments.json
  def index
    # @comments = Comment.all
    @comments = Comment.arrange(order: :created_at)
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    # @comment = Comment.new

    @comment = @post.comments.build
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    # @comment = Comment.new(comment_params)
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.parent_id = comment_params[:parent_id]

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@comment.post), notice: "Comment was successfully created." }
      else
        format.html { redirect_to post_path(@comment.post), notice: "Failed to create comment" }
        # format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_path(@comment.post), notice: "Comment was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy!

    respond_to do |format|
      format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = PostComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:post_comment).permit(:content, :post_id, :user_id, :parent_id)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
end
