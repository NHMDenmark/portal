require 'test_helper'

class SourceInstitutionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get source_institutions_index_url
    assert_response :success
  end

  test "should get show" do
    get source_institutions_show_url
    assert_response :success
  end

end
