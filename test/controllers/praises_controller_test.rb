require 'test_helper'

class PraisesControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get praises_update_url
    assert_response :success
  end

end
