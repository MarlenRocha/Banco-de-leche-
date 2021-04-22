require 'test_helper'

class EnfermedadesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enfermedad = enfermedades(:one)
  end

  test "should get index" do
    get enfermedades_url
    assert_response :success
  end

  test "should get new" do
    get new_enfermedad_url
    assert_response :success
  end

  test "should create enfermedad" do
    assert_difference('Enfermedad.count') do
      post enfermedades_url, params: { enfermedad: { clasificacion: @enfermedad.clasificacion, nombre: @enfermedad.nombre, nueva: @enfermedad.nueva, tipo: @enfermedad.tipo, tratamiento: @enfermedad.tratamiento } }
    end

    assert_redirected_to enfermedad_url(Enfermedad.last)
  end

  test "should show enfermedad" do
    get enfermedad_url(@enfermedad)
    assert_response :success
  end

  test "should get edit" do
    get edit_enfermedad_url(@enfermedad)
    assert_response :success
  end

  test "should update enfermedad" do
    patch enfermedad_url(@enfermedad), params: { enfermedad: { clasificacion: @enfermedad.clasificacion, nombre: @enfermedad.nombre, nueva: @enfermedad.nueva, tipo: @enfermedad.tipo, tratamiento: @enfermedad.tratamiento } }
    assert_redirected_to enfermedad_url(@enfermedad)
  end

  test "should destroy enfermedad" do
    assert_difference('Enfermedad.count', -1) do
      delete enfermedad_url(@enfermedad)
    end

    assert_redirected_to enfermedades_url
  end
end
