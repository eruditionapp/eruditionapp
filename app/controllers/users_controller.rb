class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, except: :show

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless (@user == current_user) || current_user.is_admin?
      deny_access
    end
  end

  private

  def admin_only
    unless current_user.is_admin?
      deny_access
    end
  end

end
