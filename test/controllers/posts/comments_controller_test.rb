# frozen_string_literal: true

require 'test_helper'

module Posts
  class CommentsControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers
    setup do
      @user = users(:one)
      @post = posts(:one)
      sign_in @user
      Post.create(body: @post.body,
                  category_id: @post.category_id,
                  creator: @post.creator,
                  title: @post.title)
      @comment = @post.comments.create(content: :comment_one)
    end

    test 'should create comment' do
      assert_difference('PostComment.count') do
        post post_comments_url(@post), params: { post_comment: { content: @comment.content } }
      end

      assert_redirected_to post_url(@post)
    end
  end
end
