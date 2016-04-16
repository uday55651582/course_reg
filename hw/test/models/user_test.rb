require 'test_helper'

class UserTest < ActiveSupport::TestCase
 test "should not save User in database without username" do
   user=User.new
   assert_not user.save
 end
 
 test "user should save" do
   user=User.new
   user.username ='test1'
   user.email ='test1@test.com' 
   user.password ='test1'
   user.type='Buyer'
   user.latitude='+19.0'
   user.longitude='-122.099'
   assert_not_nil user.save
 end
 
end
