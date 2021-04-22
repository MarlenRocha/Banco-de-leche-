require 'test_helper'

class AnalisisControllerTest < ActionDispatch::IntegrationTest
  test "should get registros" do
    get analisis_registros_url
    assert_response :success
  end

end
