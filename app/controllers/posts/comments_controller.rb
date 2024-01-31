# frozen_string_literal: true

module Posts
  class CommentsController < Posts::ApplicationController
    # POST /comments
    def create
      authenticate_user!
      @post = Post.find(params[:post_id])
      @comment = @post.comments.build(comment_params)
      @comment.user_id = current_user.id

      if @comment.save
        redirect_to post_path(@comment.post), notice: t('.create_success')
      else
        redirect_to post_path(@comment.post), notice: t('.create_error')
      end
    end

    private

    def comment_params
      params.require(:post_comment).permit(:content, :parent_id)
    end
  end
end
