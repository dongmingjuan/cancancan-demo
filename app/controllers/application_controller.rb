class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def require_is_admin
    if !current_user.admin?
      redirect_to root_path
    end
  end
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path
  end
end
