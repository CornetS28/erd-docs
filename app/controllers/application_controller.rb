# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def owner?(owner)
    return if owner == current_user

    flash[:alert] = "You don't no permission to go here"
    redirect_back fallback_location: root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[surname username first_name last_name sex email password])
  end
end
