require 'test_helper'

class PostFlowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  # test "the truth" do
  #   assert true
  # end

  setup do
    @mike = users(:mike)
  end

  test 'unknown user cant see or create posts' do
    get '/'
    follow_redirect!
    assert_template 'users/sessions/new'
  end

  test 'loggeg in user can see and create posts' do
    get '/'
    follow_redirect!
    assert_template 'users/sessions/new'
    sign_in @mike
    get '/'
    assert_template 'posts/index'
  end
end
