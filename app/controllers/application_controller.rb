class ApplicationController < ActionController::Base
    before_filter :require_login
  
  protect_from_forgery

  helper_method :current_user
  helper_method :admin?
  
  def metrify_log(event)
    render :text => "<script type=\"text/javascript\">metrify.fire(#{event});</script>"
  end
  
  
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
  
  def require_admin
    #you can only require someone to be an admin, if there is an admin user present
    if User.find_by_admin(true) != nil
      logger.info "User id (#{current_user.id}) is accessing stuff that is required to be done by an admin"
      unless admin?
        flash[:error] = "You must be admin to access user manipulation!"
        redirect_to root_url
      end
    end
  end

  
end
