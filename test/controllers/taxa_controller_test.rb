require 'test_helper'

class TaxaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get taxa_index_url
    assert_response :success
  end

  test "should get show" do
    get taxa_show_url
    assert_response :success
  end

end
