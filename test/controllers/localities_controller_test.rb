require 'test_helper'

class LocalitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get localities_index_url
    assert_response :success
  end

  test "should get show" do
    get localities_show_url
    assert_response :success
  end

end
