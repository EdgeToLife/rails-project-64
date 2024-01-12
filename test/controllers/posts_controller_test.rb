# frozen_string_literal: true

require 'pry'
require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:one)
    sign_in @user
    @post = posts(:one)
  end

  test 'should get index' do
    # binding.pry
    get posts_url
    assert_response :success
    # assert_match /#{posts(:post_one).title}/, @response.body
  end

  test 'should get new' do
    get new_post_path
    assert_response :success
  end

  test 'should create post' do
    assert_difference('Post.count') do
      post posts_url, params: { post: { body: @post.body,
                                        category_id: @post.category_id,
                                        creator: @post.creator,
                                        title: @post.title } }
    end

    assert_redirected_to post_url(Post.last)
  end

  test 'should show post' do
    get new_post_path(@post)
    assert_response :success
  end

  test 'should get edit' do
    get edit_post_url(@post)
    assert_response :success
  end

  test 'should update post' do
    patch post_url(@post), params: { post: { body: @post.body,
                                             category_id: @post.category_id,
                                             creator: @post.creator,
                                             title: @post.title } }
    assert_redirected_to post_url(@post)
  end

  test 'should destroy post' do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
