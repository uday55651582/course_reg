module UsersHelper
    
    # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # Forgets a persistent session.
  def forget(user)
    user.forget
    cookies.delete(:username)
    cookies.delete(:remember_token)
  end

  # Logs out the current user.
  def log_out
    forget(current_user)
    session.delete(:username)
    @current_user = nil
  end
end
