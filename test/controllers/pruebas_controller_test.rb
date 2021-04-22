require 'test_helper'

class PruebasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prueba = pruebas(:one)
  end

  test "should get index" do
    get pruebas_url
    assert_response :success
  end

  test "should get new" do
    get new_prueba_url
    assert_response :success
  end

  test "should create prueba" do
    assert_difference('Prueba.count') do
      post pruebas_url, params: { prueba: { cantidad: @prueba.cantidad, cantidad_almacenada: @prueba.cantidad_almacenada, cantidad_desechada: @prueba.cantidad_desechada, carbohidratos: @prueba.carbohidratos, clasificacion_id: @prueba.clasificacion_id, color: @prueba.color, crematocrito: @prueba.crematocrito, embalaje: @prueba.embalaje, etiqueta_id: @prueba.etiqueta_id, grasas: @prueba.grasas, kilocalorias: @prueba.kilocalorias, olor: @prueba.olor, proteinas: @prueba.proteinas, suciedad: @prueba.suciedad } }
    end

    assert_redirected_to prueba_url(Prueba.last)
  end

  test "should show prueba" do
    get prueba_url(@prueba)
    assert_response :success
  end

  test "should get edit" do
    get edit_prueba_url(@prueba)
    assert_response :success
  end

  test "should update prueba" do
    patch prueba_url(@prueba), params: { prueba: { cantidad: @prueba.cantidad, cantidad_almacenada: @prueba.cantidad_almacenada, cantidad_desechada: @prueba.cantidad_desechada, carbohidratos: @prueba.carbohidratos, clasificacion_id: @prueba.clasificacion_id, color: @prueba.color, crematocrito: @prueba.crematocrito, embalaje: @prueba.embalaje, etiqueta_id: @prueba.etiqueta_id, grasas: @prueba.grasas, kilocalorias: @prueba.kilocalorias, olor: @prueba.olor, proteinas: @prueba.proteinas, suciedad: @prueba.suciedad } }
    assert_redirected_to prueba_url(@prueba)
  end

  test "should destroy prueba" do
    assert_difference('Prueba.count', -1) do
      delete prueba_url(@prueba)
    end

    assert_redirected_to pruebas_url
  end
end
