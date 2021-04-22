require "application_system_test_case"

class DonacionesTest < ApplicationSystemTestCase
  setup do
    @donacion = donaciones(:one)
  end

  test "visiting the index" do
    visit donaciones_url
    assert_selector "h1", text: "Donaciones"
  end

  test "creating a Donacion" do
    visit donaciones_url
    click_on "New Donacion"

    fill_in "Donadora", with: @donacion.donadora_id
    fill_in "Fecha registro donacion", with: @donacion.fecha_registro_donacion
    click_on "Create Donacion"

    assert_text "Donacion was successfully created"
    click_on "Back"
  end

  test "updating a Donacion" do
    visit donaciones_url
    click_on "Edit", match: :first

    fill_in "Donadora", with: @donacion.donadora_id
    fill_in "Fecha registro donacion", with: @donacion.fecha_registro_donacion
    click_on "Update Donacion"

    assert_text "Donacion was successfully updated"
    click_on "Back"
  end

  test "destroying a Donacion" do
    visit donaciones_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Donacion was successfully destroyed"
  end
end
