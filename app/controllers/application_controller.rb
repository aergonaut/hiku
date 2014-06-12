class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :require_authentication
  
  protected
  
  def require_authentication
    redirect_to new_session_path unless current_user.present?
  end
  
  def current_user
    if session[:user_id] && User.exists?(session[:user_id])
      @current_user ||= User.find(session[:user_id])
    else
      session[:user_id] = nil
    end
  end
  helper_method :current_user
end
