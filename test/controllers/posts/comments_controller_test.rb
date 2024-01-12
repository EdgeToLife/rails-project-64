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

    # test "should get index" do
    #   get post_comments_url
    #   assert_response :success
    # end

    # test "should get new" do
    #   get new_post_comment_url
    #   assert_response :success
    # end

    # test "should create comment" do
    #   assert_difference("PostComment.count") do
    #     post_comment = post.post_comments.create(content: "Test comment",
    #                                              post_id: @post.id,
    #                                              user_id: @user.id,
    #                                              parent_id: nil)
    #     assert post_comment.save, "Failed to save the post_comment with content"
    #   end

    #   assert_redirected_to posts_url
    # end

    # test "should show comment" do
    #   get post_comment_url(@comment)
    #   assert_response :success
    # end

    # test "should get edit" do
    #   get edit_post_comment_url(@comment)
    #   assert_response :success
    # end

    # test "should update comment" do
    #   patch post_comment_url(@comment), params: { comment: { body: @comment.body,
    #                                                          post_id: @comment.post_id,
    #                                                          user_id: @comment.user_id } }
    #   assert_redirected_to comment_url(@comment)
    # end

    # test "should destroy comment" do
    #   assert_difference("Comment.count", -1) do
    #     delete post_comment_url(@comment)
    #   end

    #   assert_redirected_to post_comments_url
    # end
  end
end
