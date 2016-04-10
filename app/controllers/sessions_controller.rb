class SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    resource.is_admin? ? decks_path : user_path(resource)
  end
end
