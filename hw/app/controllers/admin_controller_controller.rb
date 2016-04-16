class AdminControllerController < ApplicationController
  def index
     redirect_to controller: 'users', action: 'index'
  end
  
  def error
  end 
end
