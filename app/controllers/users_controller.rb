class UsersController < ApplicationController
  
  before_filter :require_admin, :only => [:new, :create, :destroy]
  before_filter :only_your_own
  
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
    @user.employee_id = params[:employee_id]

    respond_to do |format|
        if @user.update_attributes(params[:user])
            #reload routes when user is saved to redetermine what is the default root
            Palkanlaskenta::Application.reload_routes!
              format.html { redirect_to(:controller => 'users', :action => 'edit') }
              flash[:notice] = 'Updated successfully!'
            format.xml  { head :ok }
        else
          format.html { redirect_to(:controller => 'users', :action => 'edit') }
          flash[:notice] = 'No changes were made!'
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
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
  
  def only_your_own
    accessing_own_data = false
    #relevant only if there is an admin user present
    if User.find_by_admin(true) != nil
      if current_user != nil && params[:id] != nil
      
        if (session[:user_id].to_i == params[:id].to_i)
          accessing_own_data = true
        end
      
        unless accessing_own_data == true || admin?
          logger.info "User id (#{current_user.id}) is accessing stuff that is required to be done by an admin"
          flash[:error] = "You can't access anyone else's data except yours – you are not an admin!"
          redirect_to root_url
        end
      elsif (current_user != nil && admin? == false)
          flash[:error] = "No id parameter set. You can't access anyone else's data except yours – you are not an admin!"
          redirect_to root_url
      elsif (current_user != nil && admin? == true)
          flash[:notice] = "Only admins can edit other users. You should be an admin. If not, please contact administration!"
      else
        session[:user_id] = nil
        redirect_to :log_in, :notice => 'Unknown user access error. Loggin out just to make sure! Please contact administration.'  
      end
    end
  end
  
end
