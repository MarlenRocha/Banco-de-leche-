require 'test_helper'

class DosificacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dosificacion = dosificaciones(:one)
  end

  test "should get index" do
    get dosificaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_dosificacion_url
    assert_response :success
  end

  test "should create dosificacion" do
    assert_difference('Dosificacion.count') do
      post dosificaciones_url, params: { dosificacion: { administracion: @dosificacion.administracion, area_id: @dosificacion.area_id, dosificacion: @dosificacion.dosificacion, etiqueta_id: @dosificacion.etiqueta_id, fecha_dosificacion: @dosificacion.fecha_dosificacion, reciennacido_id: @dosificacion.reciennacido_id, toma: @dosificacion.toma } }
    end

    assert_redirected_to dosificacion_url(Dosificacion.last)
  end

  test "should show dosificacion" do
    get dosificacion_url(@dosificacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_dosificacion_url(@dosificacion)
    assert_response :success
  end

  test "should update dosificacion" do
    patch dosificacion_url(@dosificacion), params: { dosificacion: { administracion: @dosificacion.administracion, area_id: @dosificacion.area_id, dosificacion: @dosificacion.dosificacion, etiqueta_id: @dosificacion.etiqueta_id, fecha_dosificacion: @dosificacion.fecha_dosificacion, reciennacido_id: @dosificacion.reciennacido_id, toma: @dosificacion.toma } }
    assert_redirected_to dosificacion_url(@dosificacion)
  end

  test "should destroy dosificacion" do
    assert_difference('Dosificacion.count', -1) do
      delete dosificacion_url(@dosificacion)
    end

    assert_redirected_to dosificaciones_url
  end
end
