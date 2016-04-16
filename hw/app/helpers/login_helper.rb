module LoginHelper
  # Logs in the given user.
  def log_in(user)
    session[:username] = user.username
  end
 
  # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.signed[:username] = user.username
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Returns the user corresponding to the remember token cookie.
  def current_user
    #puts 'current user called'
    if (username = session[:username])
      @current_user ||= User.find_by(id: username)
    elsif (username = cookies.signed[:username])
      user = User.find_by(id: username)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
     !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:username)
    @current_user = nil
  end
  
  def adminUser
    if(session[:username] && session[:username]=='admin1')
      return true
    else
      return false
    end
  end
  
end