require 'test_helper'

class HospitalesControllerTest < ActionDispatch::IntegrationTest
  test "should get inicio" do
    get hospitales_inicio_url
    assert_response :success
  end

end
