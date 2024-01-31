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
        post post_likes_path(@post)
      end
      created_like = PostLike.last
      assert_equal @user.id, created_like.user_id, 'Like should be created by the signed-in user'
      assert_equal @post.id, created_like.post_id, 'Like should be created'
      assert_redirected_to @post
    end

    test 'should not create a new like if user is not authenticated' do
      assert_no_difference 'PostLike.count' do
        post post_likes_path(@post)
      end
      assert_redirected_to new_user_session_path
    end

    test 'should destroy the like' do
      sign_in @user
      post = posts(:two)
      like = post_likes(:three)
      assert_difference 'PostLike.count', -1 do
        delete post_like_path(post, like)
      end
      assert_not PostLike.exists?(like.id), "Like with ID #{like.id} should not exist anymore"
      assert_redirected_to post
    end

    test 'should not destroy the like if user is not authenticated' do
      post = posts(:two)
      like = post_likes(:three)
      assert_no_difference 'PostLike.count' do
        delete post_like_path(post, like)
      end
      assert_redirected_to new_user_session_path
    end

    test 'should not destroy the like by other authenticated users' do
      post = posts(:two)
      like = post_likes(:three)
      user = users(:two)
      sign_in user
      assert_no_difference 'PostLike.count' do
        delete post_like_path(post, like)
      end
      assert_redirected_to post
    end
  end
end
