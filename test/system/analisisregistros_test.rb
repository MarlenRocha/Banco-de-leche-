require "application_system_test_case"

class AnalisisregistrosTest < ApplicationSystemTestCase
  setup do
    @analisisregistro = analisisregistros(:one)
  end

  test "visiting the index" do
    visit analisisregistros_url
    assert_selector "h1", text: "Analisisregistros"
  end

  test "creating a Analisisregistro" do
    visit analisisregistros_url
    click_on "New Analisisregistro"

    fill_in "Almacenado", with: @analisisregistro.almacenado_id
    fill_in "Cantidad", with: @analisisregistro.cantidad
    fill_in "Carbohidratos", with: @analisisregistro.carbohidratos
    fill_in "Clasificacion", with: @analisisregistro.clasificacion
    fill_in "Color", with: @analisisregistro.color
    fill_in "Crematocrito", with: @analisisregistro.crematocrito
    fill_in "Desechado", with: @analisisregistro.desechado_id
    fill_in "Embalaje", with: @analisisregistro.embalaje
    fill_in "Grasas", with: @analisisregistro.grasas
    fill_in "Kilocalorias", with: @analisisregistro.kilocalorias
    fill_in "Olor", with: @analisisregistro.olor
    fill_in "Proteinas", with: @analisisregistro.proteinas
    fill_in "Suciedad", with: @analisisregistro.suciedad
    click_on "Create Analisisregistro"

    assert_text "Analisisregistro was successfully created"
    click_on "Back"
  end

  test "updating a Analisisregistro" do
    visit analisisregistros_url
    click_on "Edit", match: :first

    fill_in "Almacenado", with: @analisisregistro.almacenado_id
    fill_in "Cantidad", with: @analisisregistro.cantidad
    fill_in "Carbohidratos", with: @analisisregistro.carbohidratos
    fill_in "Clasificacion", with: @analisisregistro.clasificacion
    fill_in "Color", with: @analisisregistro.color
    fill_in "Crematocrito", with: @analisisregistro.crematocrito
    fill_in "Desechado", with: @analisisregistro.desechado_id
    fill_in "Embalaje", with: @analisisregistro.embalaje
    fill_in "Grasas", with: @analisisregistro.grasas
    fill_in "Kilocalorias", with: @analisisregistro.kilocalorias
    fill_in "Olor", with: @analisisregistro.olor
    fill_in "Proteinas", with: @analisisregistro.proteinas
    fill_in "Suciedad", with: @analisisregistro.suciedad
    click_on "Update Analisisregistro"

    assert_text "Analisisregistro was successfully updated"
    click_on "Back"
  end

  test "destroying a Analisisregistro" do
    visit analisisregistros_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Analisisregistro was successfully destroyed"
  end
end
