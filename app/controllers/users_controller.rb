class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_only, except: :show
  before_action :self_or_admin_only, only: :show

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def admin_only
    deny_access unless current_user.is_admin?
  end

  def self_or_admin_only
    deny_access unless (current_user == User.find(params[:id])) || current_user.is_admin?
  end
end
