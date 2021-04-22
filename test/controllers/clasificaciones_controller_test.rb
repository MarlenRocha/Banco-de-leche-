require 'test_helper'

class ClasificacionesControllerTest < ActionDispatch::IntegrationTest
  test "should get inicio" do
    get clasificaciones_inicio_url
    assert_response :success
  end

end
