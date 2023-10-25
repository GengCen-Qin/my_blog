require "test_helper"

class TagControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tag_new_url
    assert_response :success
  end
end
