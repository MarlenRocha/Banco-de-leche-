require "application_system_test_case"

class PasteurizacionesTest < ApplicationSystemTestCase
  setup do
    @pasteurizacion = pasteurizaciones(:one)
  end

  test "visiting the index" do
    visit pasteurizaciones_url
    assert_selector "h1", text: "Pasteurizaciones"
  end

  test "creating a Pasteurizacion" do
    visit pasteurizaciones_url
    click_on "New Pasteurizacion"

    fill_in "Acidez dornic", with: @pasteurizacion.acidez_dornic
    fill_in "Cantidad almacenada", with: @pasteurizacion.cantidad_almacenada
    fill_in "Cantidad desechada", with: @pasteurizacion.cantidad_desechada
    fill_in "Etiqueta", with: @pasteurizacion.etiqueta_id
    fill_in "Pasteurizacion", with: @pasteurizacion.pasteurizacion
    click_on "Create Pasteurizacion"

    assert_text "Pasteurizacion was successfully created"
    click_on "Back"
  end

  test "updating a Pasteurizacion" do
    visit pasteurizaciones_url
    click_on "Edit", match: :first

    fill_in "Acidez dornic", with: @pasteurizacion.acidez_dornic
    fill_in "Cantidad almacenada", with: @pasteurizacion.cantidad_almacenada
    fill_in "Cantidad desechada", with: @pasteurizacion.cantidad_desechada
    fill_in "Etiqueta", with: @pasteurizacion.etiqueta_id
    fill_in "Pasteurizacion", with: @pasteurizacion.pasteurizacion
    click_on "Update Pasteurizacion"

    assert_text "Pasteurizacion was successfully updated"
    click_on "Back"
  end

  test "destroying a Pasteurizacion" do
    visit pasteurizaciones_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pasteurizacion was successfully destroyed"
  end
end
