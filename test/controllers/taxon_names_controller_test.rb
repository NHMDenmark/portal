require 'test_helper'

class TaxonNamesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get taxons_index_url
    assert_response :success
  end

  test "should get show" do
    get taxons_show_url
    assert_response :success
  end

end
