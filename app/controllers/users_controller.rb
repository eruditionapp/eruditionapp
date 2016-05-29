class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :superadmin_only,    only: [:index, :delete]
  before_action :self_or_admin_only, only: [:show, :update, :edit]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if params[:category].present?
      @decks = Category.filter_decks(params[:category]).paginate(page: params[:page])
    else
      @decks = Deck.paginate(page: params[:page]).order(:title)
    end
  end

  def dashboard
  end

  def edit
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

  def deck_preview
    @user = User.find(params[:id])
    @deck = Deck.find(params[:deck_id])
  end

  private

  def secure_params
    params.require(:user).permit(:role)
  end
end
