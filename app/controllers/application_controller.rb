class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def deny_access
    url = request.env["HTTP_REFERER"] || user_path(current_user)
    redirect_to url, alert: "You do not have access to this page."
  end
end
