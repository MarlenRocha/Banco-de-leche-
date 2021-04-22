require 'test_helper'

class ReciennacidosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reciennacido = reciennacidos(:one)
  end

  test "should get index" do
    get reciennacidos_url
    assert_response :success
  end

  test "should get new" do
    get new_reciennacido_url
    assert_response :success
  end

  test "should create reciennacido" do
    assert_difference('Reciennacido.count') do
      post reciennacidos_url, params: { reciennacido: { altura: @reciennacido.altura, area_id: @reciennacido.area_id, descripcion: @reciennacido.descripcion, edad_madre: @reciennacido.edad_madre, enfermedad_id: @reciennacido.enfermedad_id, fecha_nacimiento: @reciennacido.fecha_nacimiento, medico_id: @reciennacido.medico_id, nombre_madre: @reciennacido.nombre_madre, peso: @reciennacido.peso } }
    end

    assert_redirected_to reciennacido_url(Reciennacido.last)
  end

  test "should show reciennacido" do
    get reciennacido_url(@reciennacido)
    assert_response :success
  end

  test "should get edit" do
    get edit_reciennacido_url(@reciennacido)
    assert_response :success
  end

  test "should update reciennacido" do
    patch reciennacido_url(@reciennacido), params: { reciennacido: { altura: @reciennacido.altura, area_id: @reciennacido.area_id, descripcion: @reciennacido.descripcion, edad_madre: @reciennacido.edad_madre, enfermedad_id: @reciennacido.enfermedad_id, fecha_nacimiento: @reciennacido.fecha_nacimiento, medico_id: @reciennacido.medico_id, nombre_madre: @reciennacido.nombre_madre, peso: @reciennacido.peso } }
    assert_redirected_to reciennacido_url(@reciennacido)
  end

  test "should destroy reciennacido" do
    assert_difference('Reciennacido.count', -1) do
      delete reciennacido_url(@reciennacido)
    end

    assert_redirected_to reciennacidos_url
  end
end
