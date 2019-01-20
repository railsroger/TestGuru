class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_paramters, if: :devise_controller?

  protected

  def configure_permitted_paramters
  	devise_parameter_sanitizer.permit(:sign_up, keys:[:first_name, :last_name])
  end

  def after_sign_in_path_for(user)
    if user.admin?
      admin_tests_path
    else
      tests_path
    end
  end
end
