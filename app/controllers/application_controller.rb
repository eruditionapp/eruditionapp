class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def superadmin_only
    deny_access unless current_user.is_superadmin?
  end

  def admin_only
    deny_access unless current_user.is_admin?
  end

  def superadmin_or_admin_only
    deny_access unless (current_user.is_superadmin? || current_user.is_admin?)
  end

  def self_or_admin_only
    deny_access unless (current_user == User.find(params[:id])) || current_user.is_admin?
  end

  def deny_access
    url = request.env["HTTP_REFERER"] || user_path(current_user)
    redirect_to url, alert: "You do not have access to this page."
  end
end
