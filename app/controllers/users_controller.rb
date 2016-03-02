class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :superadmin_only, only: :index
  before_action :admin_only, except: :show
  before_action :self_or_admin_only, only: :show

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes secure_params
      redirect_to users_path, alert: "User #{@user.email} updated."
    else
      redirect_to users_path, alert: 'Unabled to update user.'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_path, alert: 'User deleted.'
  end

  private

  def superadmin_only
    deny_access unless current_user.is_superadmin?
  end

  def admin_only
    deny_access unless current_user.is_admin?
  end

  def self_or_admin_only
    deny_access unless (current_user == User.find(params[:id])) || current_user.is_admin?
  end

  def secure_params
    params.require(:user).permit(:role)
  end
end
