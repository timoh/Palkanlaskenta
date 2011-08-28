class ApplicationController < ActionController::Base
    before_filter :require_login
  
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
    #relevant question only if one or more admins exist..
    if User.find_by_admin(true) != nil
      current_user.admin?
    else
      true
    end
  end

  
end
