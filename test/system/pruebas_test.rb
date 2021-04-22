require "application_system_test_case"

class PruebasTest < ApplicationSystemTestCase
  setup do
    @prueba = pruebas(:one)
  end

  test "visiting the index" do
    visit pruebas_url
    assert_selector "h1", text: "Pruebas"
  end

  test "creating a Prueba" do
    visit pruebas_url
    click_on "New Prueba"

    fill_in "Cantidad", with: @prueba.cantidad
    fill_in "Cantidad almacenada", with: @prueba.cantidad_almacenada
    fill_in "Cantidad desechada", with: @prueba.cantidad_desechada
    fill_in "Carbohidratos", with: @prueba.carbohidratos
    fill_in "Clasificacion", with: @prueba.clasificacion_id
    fill_in "Color", with: @prueba.color
    fill_in "Crematocrito", with: @prueba.crematocrito
    fill_in "Embalaje", with: @prueba.embalaje
    fill_in "Etiqueta", with: @prueba.etiqueta_id
    fill_in "Grasas", with: @prueba.grasas
    fill_in "Kilocalorias", with: @prueba.kilocalorias
    fill_in "Olor", with: @prueba.olor
    fill_in "Proteinas", with: @prueba.proteinas
    fill_in "Suciedad", with: @prueba.suciedad
    click_on "Create Prueba"

    assert_text "Prueba was successfully created"
    click_on "Back"
  end

  test "updating a Prueba" do
    visit pruebas_url
    click_on "Edit", match: :first

    fill_in "Cantidad", with: @prueba.cantidad
    fill_in "Cantidad almacenada", with: @prueba.cantidad_almacenada
    fill_in "Cantidad desechada", with: @prueba.cantidad_desechada
    fill_in "Carbohidratos", with: @prueba.carbohidratos
    fill_in "Clasificacion", with: @prueba.clasificacion_id
    fill_in "Color", with: @prueba.color
    fill_in "Crematocrito", with: @prueba.crematocrito
    fill_in "Embalaje", with: @prueba.embalaje
    fill_in "Etiqueta", with: @prueba.etiqueta_id
    fill_in "Grasas", with: @prueba.grasas
    fill_in "Kilocalorias", with: @prueba.kilocalorias
    fill_in "Olor", with: @prueba.olor
    fill_in "Proteinas", with: @prueba.proteinas
    fill_in "Suciedad", with: @prueba.suciedad
    click_on "Update Prueba"

    assert_text "Prueba was successfully updated"
    click_on "Back"
  end

  test "destroying a Prueba" do
    visit pruebas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Prueba was successfully destroyed"
  end
end
