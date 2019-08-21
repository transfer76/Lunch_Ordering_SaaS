class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  #after_action :verify_authorized, except: :index, unless: :devise_controller?
  #after_action :verify_policy_scoped, only: :index

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: [:password, :password_confirmation, :current_password]
    )
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :admin])
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
