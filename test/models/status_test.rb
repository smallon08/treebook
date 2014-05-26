require 'test_helper'

class StatusTest < ActiveSupport::TestCase
   test "status require contenet" do
   	status = Status.new
   	assert !status.save
    assert !status.errors[:content].empty?
   end

   test "status content is at least 2 letter long" do
   	status = Status.new
   	status.content = "h"
   	assert !status.save
    assert !status.errors[:content].empty?
   end

   test "status must have a user id" do
   	status = Status.new
   	status.content = "h e e  eee"
   	assert !status.save
    assert !status.errors[:user_id].empty?

   	end

end
