require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_index_url
    assert_response :success
  end

  test "should get projects" do
    get admin_projects_url
    assert_response :success
  end

  test "should get discussions" do
    get admin_discussions_url
    assert_response :success
  end

  test "should get users" do
    get admin_users_url
    assert_response :success
  end

  test "should get show_project" do
    get admin_show_project_url
    assert_response :success
  end
end
