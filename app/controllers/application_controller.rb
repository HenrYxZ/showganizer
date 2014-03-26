class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #before_filter :require_login

  helper_method :current_user
  helper_method :current_user_is_admin?
  


  protected
  def current_user
  	@current_user ||= session.has_key?(:user_id) && User.find(session[:user_id])
  end
  def current_user_is_admin?
    if current_user
      return current_user.type_of_user=="admin"
    else
      return false
    end
  end

  private
  def require_login
  	redirect_to new_session_path unless current_user
  end
end
