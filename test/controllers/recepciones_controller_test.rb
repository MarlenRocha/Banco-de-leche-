require 'test_helper'

class RecepcionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recepcion = recepciones(:one)
  end

  test "should get index" do
    get recepciones_url
    assert_response :success
  end

  test "should get new" do
    get new_recepcion_url
    assert_response :success
  end

  test "should create recepcion" do
    assert_difference('Recepcion.count') do
      post recepciones_url, params: { recepcion: { area_id: @recepcion.area_id, cantidad: @recepcion.cantidad, fecha_extraccion: @recepcion.fecha_extraccion, frasco_id: @recepcion.frasco_id } }
    end

    assert_redirected_to recepcion_url(Recepcion.last)
  end

  test "should show recepcion" do
    get recepcion_url(@recepcion)
    assert_response :success
  end

  test "should get edit" do
    get edit_recepcion_url(@recepcion)
    assert_response :success
  end

  test "should update recepcion" do
    patch recepcion_url(@recepcion), params: { recepcion: { area_id: @recepcion.area_id, cantidad: @recepcion.cantidad, fecha_extraccion: @recepcion.fecha_extraccion, frasco_id: @recepcion.frasco_id } }
    assert_redirected_to recepcion_url(@recepcion)
  end

  test "should destroy recepcion" do
    assert_difference('Recepcion.count', -1) do
      delete recepcion_url(@recepcion)
    end

    assert_redirected_to recepciones_url
  end
end
