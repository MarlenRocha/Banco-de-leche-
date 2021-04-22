require "application_system_test_case"

class NacionalidadesTest < ApplicationSystemTestCase
  setup do
    @nacionalidad = nacionalidades(:one)
  end

  test "visiting the index" do
    visit nacionalidades_url
    assert_selector "h1", text: "Nacionalidades"
  end

  test "creating a Nacionalidad" do
    visit nacionalidades_url
    click_on "New Nacionalidad"

    fill_in "Descripcion", with: @nacionalidad.descripcion
    fill_in "Espacio geografico", with: @nacionalidad.espacio_geografico
    fill_in "Estado", with: @nacionalidad.estado
    fill_in "Nombre", with: @nacionalidad.nombre
    fill_in "Territorio", with: @nacionalidad.territorio
    fill_in "Tipo", with: @nacionalidad.tipo
    click_on "Create Nacionalidad"

    assert_text "Nacionalidad was successfully created"
    click_on "Back"
  end

  test "updating a Nacionalidad" do
    visit nacionalidades_url
    click_on "Edit", match: :first

    fill_in "Descripcion", with: @nacionalidad.descripcion
    fill_in "Espacio geografico", with: @nacionalidad.espacio_geografico
    fill_in "Estado", with: @nacionalidad.estado
    fill_in "Nombre", with: @nacionalidad.nombre
    fill_in "Territorio", with: @nacionalidad.territorio
    fill_in "Tipo", with: @nacionalidad.tipo
    click_on "Update Nacionalidad"

    assert_text "Nacionalidad was successfully updated"
    click_on "Back"
  end

  test "destroying a Nacionalidad" do
    visit nacionalidades_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Nacionalidad was successfully destroyed"
  end
end
