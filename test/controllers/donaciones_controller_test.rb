require 'test_helper'

class DonacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @donacion = donaciones(:one)
  end

  test "should get index" do
    get donaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_donacion_url
    assert_response :success
  end

  test "should create donacion" do
    assert_difference('Donacion.count') do
      post donaciones_url, params: { donacion: { donadora_id: @donacion.donadora_id, fecha_registro_donacion: @donacion.fecha_registro_donacion } }
    end

    assert_redirected_to donacion_url(Donacion.last)
  end

  test "should show donacion" do
    get donacion_url(@donacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_donacion_url(@donacion)
    assert_response :success
  end

  test "should update donacion" do
    patch donacion_url(@donacion), params: { donacion: { donadora_id: @donacion.donadora_id, fecha_registro_donacion: @donacion.fecha_registro_donacion } }
    assert_redirected_to donacion_url(@donacion)
  end

  test "should destroy donacion" do
    assert_difference('Donacion.count', -1) do
      delete donacion_url(@donacion)
    end

    assert_redirected_to donaciones_url
  end
end
