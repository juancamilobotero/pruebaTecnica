require 'test_helper'

class PrincipalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get principals_index_url
    assert_response :success
  end

end
