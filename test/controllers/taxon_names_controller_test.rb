require 'test_helper'

class TaxonNamesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get taxon_names_index_url
    assert_response :success
  end

  test "should get show" do
    get taxon_names_show_url
    assert_response :success
  end

end
