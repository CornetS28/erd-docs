# frozen_string_literal: true

require 'test_helper'

class CommentFlowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @mike = users(:mike)
    @post = posts(:one)
  end

  test 'Comment is added' do
    get '/'
    follow_redirect!
    assert_template 'users/sessions/new'
    sign_in @mike
    get '/'
    assert_difference '@post.comments.count', 1 do
      post '/comments', params: { post_id: @post.id, user_id: @mike.id, comment: 'The next comment' }
    end
  end
end
