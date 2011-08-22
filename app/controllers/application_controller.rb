class ApplicationController < ActionController::Base
  if User.all.count > 0 
    before_filter :require_login
  end
  
  protect_from_forgery

  helper_method :current_user
  helper_method :admin?
  
  
  def require_login
    unless current_user
      redirect_to :log_in, :notice => "Please log in!"
    end
  end
  
  private
  
  def current_user
    if User.all.count >0
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end
  
  def admin?
    current_user.admin?
  end

  
end
