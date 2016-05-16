class StaticController < ApplicationController

  def home
    redirect_to current_user.is_admin? ? decks_path : user_path(current_user) if current_user
  end

end
