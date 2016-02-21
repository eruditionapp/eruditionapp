class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, except: :show

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def admin_only
    unless current_user.is_admin?
      url = request.env["HTTP_REFERER"] || user_path(current_user)
      redirect_to url, alert: "You do not have access to this page."
    end
  end

end
