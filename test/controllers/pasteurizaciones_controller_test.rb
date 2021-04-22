require 'test_helper'

class PasteurizacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pasteurizacion = pasteurizaciones(:one)
  end

  test "should get index" do
    get pasteurizaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_pasteurizacion_url
    assert_response :success
  end

  test "should create pasteurizacion" do
    assert_difference('Pasteurizacion.count') do
      post pasteurizaciones_url, params: { pasteurizacion: { acidez_dornic: @pasteurizacion.acidez_dornic, cantidad_almacenada: @pasteurizacion.cantidad_almacenada, cantidad_desechada: @pasteurizacion.cantidad_desechada, etiqueta_id: @pasteurizacion.etiqueta_id, pasteurizacion: @pasteurizacion.pasteurizacion } }
    end

    assert_redirected_to pasteurizacion_url(Pasteurizacion.last)
  end

  test "should show pasteurizacion" do
    get pasteurizacion_url(@pasteurizacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_pasteurizacion_url(@pasteurizacion)
    assert_response :success
  end

  test "should update pasteurizacion" do
    patch pasteurizacion_url(@pasteurizacion), params: { pasteurizacion: { acidez_dornic: @pasteurizacion.acidez_dornic, cantidad_almacenada: @pasteurizacion.cantidad_almacenada, cantidad_desechada: @pasteurizacion.cantidad_desechada, etiqueta_id: @pasteurizacion.etiqueta_id, pasteurizacion: @pasteurizacion.pasteurizacion } }
    assert_redirected_to pasteurizacion_url(@pasteurizacion)
  end

  test "should destroy pasteurizacion" do
    assert_difference('Pasteurizacion.count', -1) do
      delete pasteurizacion_url(@pasteurizacion)
    end

    assert_redirected_to pasteurizaciones_url
  end
end
