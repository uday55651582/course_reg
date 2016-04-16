class User < ActiveRecord::Base
   has_secure_password
   EMAIL_REGEX = /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
   validates :username, :email, :latitude, :longitude, :password, :password_confirmation, :presence => true
  
  def self.authenticate(username_or_email="", password="")
    if EMAIL_REGEX.match(username_or_email)  
      user = User.find_by_email(username_or_email)
    else
      user = User.find_by_username(username_or_email)
    end
    if user && user.match_password(password)
      return user
    else
      return false
    end
  end
  
   def encrypted_password
        self.encrypted_password = BCrypt::Password.create(password) if password.present?  
   end
 
  def match_password(password="")
    BCrypt::Password.new(password) == password
  end
end
