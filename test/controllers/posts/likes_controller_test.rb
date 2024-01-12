# frozen_string_literal: true

require 'test_helper'

module Posts
  class LikesControllerTest < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers
    setup do
      @user = users(:one)
      @post = posts(:one)
    end

    test 'should create a new like' do
      sign_in @user
      assert_difference 'PostLike.count', 1 do
        post post_likes_path(@post), params: { post_id: @post.id, user_id: @user.id }
      end

      assert_redirected_to @post
    end

    test 'should not create a new like if user is not authenticated' do
      assert_no_difference 'PostLike.count' do
        post post_likes_path(@post), params: { post_id: @post.id, user_id: @user.id }
      end

      assert_redirected_to new_user_session_path
    end

    test 'should destroy the like' do
      sign_in @user
      like = @post.likes.create(user_id: @user.id)
      assert_difference 'PostLike.count', -1 do
        delete post_like_path(@post, like)
      end

      assert_redirected_to @post
    end

    test 'should not destroy the like if user is not authenticated' do
      like = @post.likes.create(user_id: @user.id)
      assert_no_difference 'PostLike.count' do
        delete post_like_path(@post, like)
      end

      assert_redirected_to new_user_session_path
    end

    test 'should not destroy the like by other authenticated users' do
      like = @post.likes.create(user_id: @user.id)
      user = users(:two)
      sign_in user
      assert_no_difference 'PostLike.count' do
        delete post_like_path(@post, like)
      end

      assert_redirected_to @post
    end
  end
end
