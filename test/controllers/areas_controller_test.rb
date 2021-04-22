require 'test_helper'

class AreasControllerTest < ActionDispatch::IntegrationTest
  test "should get inicio" do
    get areas_inicio_url
    assert_response :success
  end

end
