require 'test_helper'

class DonadorasControllerTest < ActionDispatch::IntegrationTest
  test "should get inicio" do
    get donadoras_inicio_url
    assert_response :success
  end

end
