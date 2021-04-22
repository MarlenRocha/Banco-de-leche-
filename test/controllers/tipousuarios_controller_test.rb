require 'test_helper'

class TipousuariosControllerTest < ActionDispatch::IntegrationTest
  test "should get inicio" do
    get tipousuarios_inicio_url
    assert_response :success
  end

end
