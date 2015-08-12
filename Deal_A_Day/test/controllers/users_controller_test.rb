require 'test_helper'
include Devise::TestHelpers

class UsersControllerTest < ActionController::TestCase
  #test "should get upload_data" do
  #  get :upload_data
  #  assert_response :success
  #end

  test "should get index" do
    sign_in users(:one)
    get :index
    assert_response :success
    assert_select 'div#uploadfile', :count => 1
  end

end
