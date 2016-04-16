class User < ActiveRecord::Base
  #attr_accessor :password
  #EMAIL_REGEX = \^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$\i
  validates :username, :presence => true, :uniqueness => true
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true #password_confirmation attr
  validates :latitude ,:presence => true, numericality: { greater_than_or_equal_to: +18.005611, less_than_or_equal_to:  +48.987386  }
 # validates :longitude,:presence => true, numericality: { greater_than_or_equal_to: -124.626080, less_than_or_equal_to: -62.36101 }
end
