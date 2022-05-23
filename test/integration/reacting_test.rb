require 'test_helper'

class ReactingTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @micropost = microposts(:orange)
    log_in_as(@user)
  end

  test "reacting page" do
    get reacting_user_path(@user)
    assert_not @user.reacting.empty?
    assert_match @user.reacting.count.to_s, response.body
  end
  
  test "react a micropost and un_react a micropost" do
    get root_path
    assert_template 'static_pages/home'
  end

end

