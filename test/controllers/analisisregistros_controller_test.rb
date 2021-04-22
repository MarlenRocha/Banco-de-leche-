require 'test_helper'

class AnalisisregistrosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @analisisregistro = analisisregistros(:one)
  end

  test "should get index" do
    get analisisregistros_url
    assert_response :success
  end

  test "should get new" do
    get new_analisisregistro_url
    assert_response :success
  end

  test "should create analisisregistro" do
    assert_difference('Analisisregistro.count') do
      post analisisregistros_url, params: { analisisregistro: { almacenado_id: @analisisregistro.almacenado_id, cantidad: @analisisregistro.cantidad, carbohidratos: @analisisregistro.carbohidratos, clasificacion: @analisisregistro.clasificacion, color: @analisisregistro.color, crematocrito: @analisisregistro.crematocrito, desechado_id: @analisisregistro.desechado_id, embalaje: @analisisregistro.embalaje, grasas: @analisisregistro.grasas, kilocalorias: @analisisregistro.kilocalorias, olor: @analisisregistro.olor, proteinas: @analisisregistro.proteinas, suciedad: @analisisregistro.suciedad } }
    end

    assert_redirected_to analisisregistro_url(Analisisregistro.last)
  end

  test "should show analisisregistro" do
    get analisisregistro_url(@analisisregistro)
    assert_response :success
  end

  test "should get edit" do
    get edit_analisisregistro_url(@analisisregistro)
    assert_response :success
  end

  test "should update analisisregistro" do
    patch analisisregistro_url(@analisisregistro), params: { analisisregistro: { almacenado_id: @analisisregistro.almacenado_id, cantidad: @analisisregistro.cantidad, carbohidratos: @analisisregistro.carbohidratos, clasificacion: @analisisregistro.clasificacion, color: @analisisregistro.color, crematocrito: @analisisregistro.crematocrito, desechado_id: @analisisregistro.desechado_id, embalaje: @analisisregistro.embalaje, grasas: @analisisregistro.grasas, kilocalorias: @analisisregistro.kilocalorias, olor: @analisisregistro.olor, proteinas: @analisisregistro.proteinas, suciedad: @analisisregistro.suciedad } }
    assert_redirected_to analisisregistro_url(@analisisregistro)
  end

  test "should destroy analisisregistro" do
    assert_difference('Analisisregistro.count', -1) do
      delete analisisregistro_url(@analisisregistro)
    end

    assert_redirected_to analisisregistros_url
  end
end
