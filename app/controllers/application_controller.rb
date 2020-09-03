class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  #before_action :dispatch_user
  before_action :custom_param_devise, if: :devise_controller?

  def dispatch_user

    return unless current_user && request.get?

    path = new_profile_path unless current_user.valid?
    path = dashboard_path if request.path == root_path

    redirect_to path unless path.nil? || path == request.path
  end

  def custom_param_devise
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name address trainer])
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
