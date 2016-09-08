class AdminController < ApplicationController
  before_action :require_admin

  private

  def require_admin
    if session[:user_id] == nil
      session[:flash] = "You must log in to access that area"
      redirect_to new_admin_session_path
    end
  end

end
