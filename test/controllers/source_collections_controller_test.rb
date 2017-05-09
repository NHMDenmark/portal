require 'test_helper'

class SourceCollectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get source_collections_index_url
    assert_response :success
  end

  test "should get show" do
    get source_collections_show_url
    assert_response :success
  end

end
