class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :dispatch_user

  def dispatch_user
    return unless current_user && request.get?

    path = new_profile_path unless current_user.valid?
    path = dashboard_path if request.path == root_path

    redirect_to path unless path.nil? || path == request.path
  end
end
