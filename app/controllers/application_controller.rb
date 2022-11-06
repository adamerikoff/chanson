class ApplicationController < ActionController::Base  
  helper_method :current_user, :logged_in?, :is_admin?

  def index
  end

  def current_user
    if session[:user_id] && session[:user_id] != nil
      @current_user ||= User.find(session[:user_id])
    end
  end
   
  def logged_in?
    !!current_user
  end

  def is_admin?
    @current_user.admin_status
  end

  def authorize
    if !(logged_in? && is_admin?)
      redirect_to root_path, alert: "Not authorized."
    end
  end

end
