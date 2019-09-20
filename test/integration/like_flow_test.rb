# frozen_string_literal: true

require 'test_helper'

class LikeFlowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @mike = users(:mike)
    @post = posts(:two)
    @mike_post = posts(:one)
  end

  test 'like increase when user like' do
    get '/'
    follow_redirect!
    assert_template 'users/sessions/new'
    sign_in @mike
    get '/'
    assert_difference '@post.likes.count', 1 do
      post '/likes', params: {post_id: @post.id, user_id: @mike.id}
    end
  end

  test 'like decrement when user dis-like' do
    get '/'
    follow_redirect!
    assert_template 'users/sessions/new'
    sign_in @mike
    get '/'
    assert_difference '@mike_post.likes.count', -1 do
      delete "/likes/#{@mike_post.id}"
    end
  end
end
