class Item < ActiveRecord::Base
  before_update { self.email = email.downcase }
  attr_accessor :xemail
  attr_accessor :xprice
  attr_accessor :cprice
end
