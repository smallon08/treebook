require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  
  test "should get show" do
    get :show, id: users(:jason).profile_name
    assert_response :success
    assert_template 'profile/show'
  end

  test "shd render a 404 on profile not found" do
  	get :show, id: "not exit"
  	assert_response :not_found
  end

  test "variable assign successful profile viewing" do
  	get :show, id: users(:jason).profile_name
  	assert assigns(:user)
  	assert_not_empty assigns(:statuses)
  end

  test "only correct statuses shown" do
  	get :show, id: users(:jason).profile_name
  	assigns(:statuses).each do |status|
  		assert_equal users(:jason), status.user
  	end  	
  end


end
