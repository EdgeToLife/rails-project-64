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
    get posts_url
    assert_response :success
  end

  test 'should get new' do
    get new_post_path
    assert_response :success
  end

  test 'should create post' do
    category = categories(:one)
    attrs = {
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph_by_chars(number: 100),
      category_id: category.id
    }
    assert_difference('Post.count') do
      post posts_url, params: { post: attrs }
    end
    post = Post.find_by(attrs)
    assert { post }
    assert_redirected_to post_url(post)
  end

  test 'should show post' do
    get post_url(@post)
    assert_response :success
  end
end
