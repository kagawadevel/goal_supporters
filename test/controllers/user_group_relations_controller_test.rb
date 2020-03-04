require 'test_helper'

class UserGroupRelationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_group_relations_index_url
    assert_response :success
  end

  test "should get create" do
    get user_group_relations_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_group_relations_destroy_url
    assert_response :success
  end

end
