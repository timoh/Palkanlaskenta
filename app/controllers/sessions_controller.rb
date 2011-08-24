class SessionsController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]
  
  def new
    render :layout => 'log_in'
  end
  
  def create
    user = User.authenticate(params[:email], params[:password])
    if user != nil
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      session[:user_id] = nil
      flash.now.alert = "Invalid email or password!"
      redirect_to log_in, :notice => 'log_in'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Successfully logged out!"
  end

end
