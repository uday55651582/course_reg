class UsersController < ApplicationController
  def index
  
  end
  
  def signup
   
  
  def profile
    @users=User.new
    @users.save
  end 
  end
  
  
end

#( params.require(:user).permit(:username, :email, :location, :password))