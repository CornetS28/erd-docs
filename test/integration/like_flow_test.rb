require 'test_helper'

class LikeFlowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @mike = users(:mike)
    @post = posts(:two)
  end
  # test "the truth" do
  #   assert true
  # end

  test 'like increase when user like' do
    get '/'
    follow_redirect!
    assert_template 'users/sessions/new'
    sign_in @mike
    get '/'
    assert_difference '@post.likes_count', 1 do
      post '/likes', params: {post_id: @post.id, user_id: @mike.id}
    end
  end
end
