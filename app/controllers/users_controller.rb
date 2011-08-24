class UsersController < ApplicationController
  if User.all.count == 0 
    skip_before_filter :require_login, :only => [:new, :create]
  end
  
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    before_filter :require_admin
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    before_filter :require_admin
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        #reload routes when user is saved to redetermine what is the default root
        Palkanlaskenta::Application.reload_routes!
        format.html { redirect_to(@user, :notice => 'User was successfully created.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        #reload routes when user is saved to redetermine what is the default root
        Palkanlaskenta::Application.reload_routes!
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    before_filter :require_admin
    @user = User.find(params[:id])
    @user.destroy
    
    #reload routes when user is saved to redetermine what is the default root
    Palkanlaskenta::Application.reload_routes!

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  def require_admin
    unless admin?
      flash[:error] = "You must be admin to access user manipulation!"
      redirect_to root_url
    end
  end
  
end
