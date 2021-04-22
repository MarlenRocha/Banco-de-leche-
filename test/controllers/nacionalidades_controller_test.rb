require 'test_helper'

class NacionalidadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nacionalidad = nacionalidades(:one)
  end

  test "should get index" do
    get nacionalidades_url
    assert_response :success
  end

  test "should get new" do
    get new_nacionalidad_url
    assert_response :success
  end

  test "should create nacionalidad" do
    assert_difference('Nacionalidad.count') do
      post nacionalidades_url, params: { nacionalidad: { descripcion: @nacionalidad.descripcion, espacio_geografico: @nacionalidad.espacio_geografico, estado: @nacionalidad.estado, nombre: @nacionalidad.nombre, territorio: @nacionalidad.territorio, tipo: @nacionalidad.tipo } }
    end

    assert_redirected_to nacionalidad_url(Nacionalidad.last)
  end

  test "should show nacionalidad" do
    get nacionalidad_url(@nacionalidad)
    assert_response :success
  end

  test "should get edit" do
    get edit_nacionalidad_url(@nacionalidad)
    assert_response :success
  end

  test "should update nacionalidad" do
    patch nacionalidad_url(@nacionalidad), params: { nacionalidad: { descripcion: @nacionalidad.descripcion, espacio_geografico: @nacionalidad.espacio_geografico, estado: @nacionalidad.estado, nombre: @nacionalidad.nombre, territorio: @nacionalidad.territorio, tipo: @nacionalidad.tipo } }
    assert_redirected_to nacionalidad_url(@nacionalidad)
  end

  test "should destroy nacionalidad" do
    assert_difference('Nacionalidad.count', -1) do
      delete nacionalidad_url(@nacionalidad)
    end

    assert_redirected_to nacionalidades_url
  end
end
