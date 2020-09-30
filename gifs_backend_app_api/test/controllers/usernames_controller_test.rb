require 'test_helper'

class UsernamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @username = usernames(:one)
  end

  test "should get index" do
    get usernames_url, as: :json
    assert_response :success
  end

  test "should create username" do
    assert_difference('Username.count') do
      post usernames_url, params: { username: { password: @username.password } }, as: :json
    end

    assert_response 201
  end

  test "should show username" do
    get username_url(@username), as: :json
    assert_response :success
  end

  test "should update username" do
    patch username_url(@username), params: { username: { password: @username.password } }, as: :json
    assert_response 200
  end

  test "should destroy username" do
    assert_difference('Username.count', -1) do
      delete username_url(@username), as: :json
    end

    assert_response 204
  end
end
