class LoginController < ApplicationController
  def new
  end
 
  def create
    @user= User.find_by(username: params[:login][:username], password: params[:login][:password], type: params[:login][:type] )
     respond_to do |format|
      if @user and @user.username and @user.type!="Admin"
          log_in(@user)
          format.html { redirect_to @user, notice: 'Welcome' }
          format.json { render :show, status: :created, location: @user }
      elsif @user and @user.username and @user.type =="Admin"
          log_in(@user)
          format.html { redirect_to controller: 'admin_controller',action: 'index' }
      else
          format.html { redirect_to controller: 'welcome', action: 'index', notice: 'invalid user id or password or Type combination' }
      end
     end
  end
  
  def destroy
      log_out
  end

end 

