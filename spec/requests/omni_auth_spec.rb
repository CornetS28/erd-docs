# frozen_string_literal: true

require 'rails_helper'
 
OmniAuth.config.test_mode = true
OmniAuth.config.mock_auth[:facebook] = OpenStruct.new(
  provider: 'facebook',
  info: OpenStruct.new(
    name: 'first last',
    email: 'email@email.com',
    image: ''
  )
)
RSpec.describe 'Omniauth', type: :request do
  describe 'Facebook login flow' do  
    it '' do
      get posts_path
      expect(response).to redirect_to(user_session_path)
      get user_facebook_omniauth_authorize_path
      follow_redirect!
      expect(response).to redirect_to(posts_path)
    end
  end
end