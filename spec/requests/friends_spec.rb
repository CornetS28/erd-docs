require 'rails_helper'

RSpec.describe "Friends", type: :request do
  describe 'Friendship flow' do
    before do
      @first_user = create :user
      sign_in_as @first_user
      @second_user = create :friend
    end
    it 'Friend increase and request reduce when request is accepted' do
      get posts_path
      expect(response).to have_http_status(200)
      expect(@first_user.requests).to be_empty
      expect(@second_user.requests).to be_empty
      post '/friends', params: { friend_id: @second_user.id }
      expect(@first_user.friend_requests).not_to be_empty
      expect(@second_user.requests).not_to be_empty
      log_out
      sign_in_as @second_user
      expect(@second_user.requests).not_to be_empty
      patch '/friends', params: { friend_id: @first_user.id }
      expect(@second_user.friends).not_to be_empty
      expect(@first_user.friends).not_to be_empty
      expect(@first_user.requests).to be_empty
    end
  end
end
