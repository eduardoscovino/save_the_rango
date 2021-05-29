require 'test_helper'

class SignaturesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get signatures_index_url
    assert_response :success
  end

  test "should get show" do
    get signatures_show_url
    assert_response :success
  end

end
