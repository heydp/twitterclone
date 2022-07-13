require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end
  test "should get new" do
    # get users_new_url
    get '/signup'
    # get signup_url
    
    assert_response :success
  end
  test "should redirect edit when not logged in" do
    #get '/users/:id/edit', params: {id: @user}
    get edit_user_url(@user), params: {id: @user}
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  test "should redirect update when not logged in" do
    patch '/users/:id', params: {id: @user, user: { name: @user.name, email: @user.email }}
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  

end
