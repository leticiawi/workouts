class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permited_parameter, if: :devise_controller?

  def configure_permited_parameter
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address])
  end
end
