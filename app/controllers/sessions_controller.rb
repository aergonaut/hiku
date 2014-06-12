class SessionsController < ApplicationController
  skip_before_action :require_authentication

  def new
  end

  def create
    auth = Authentication.new(request.env["omniauth.auth"])
    if auth.authenticated?
      session[:user_id] = auth.user.id
      redirect_to root_path
    else
      flash[:danger] = "You could not be authenticated."
      redirect_to new_session_path
    end
  end
end
