module ValidUserRequestHelper
  def sign_in_as user
    post user_session_path, params: { user: { email: user.email, password: user.password } }
  end

  def log_out
    delete destroy_user_session_path
  end
end
