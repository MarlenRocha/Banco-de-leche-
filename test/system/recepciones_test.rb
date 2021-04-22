require "application_system_test_case"

class RecepcionesTest < ApplicationSystemTestCase
  setup do
    @recepcion = recepciones(:one)
  end

  test "visiting the index" do
    visit recepciones_url
    assert_selector "h1", text: "Recepciones"
  end

  test "creating a Recepcion" do
    visit recepciones_url
    click_on "New Recepcion"

    fill_in "Area", with: @recepcion.area_id
    fill_in "Cantidad", with: @recepcion.cantidad
    fill_in "Fecha extraccion", with: @recepcion.fecha_extraccion
    fill_in "Frasco", with: @recepcion.frasco_id
    click_on "Create Recepcion"

    assert_text "Recepcion was successfully created"
    click_on "Back"
  end

  test "updating a Recepcion" do
    visit recepciones_url
    click_on "Edit", match: :first

    fill_in "Area", with: @recepcion.area_id
    fill_in "Cantidad", with: @recepcion.cantidad
    fill_in "Fecha extraccion", with: @recepcion.fecha_extraccion
    fill_in "Frasco", with: @recepcion.frasco_id
    click_on "Update Recepcion"

    assert_text "Recepcion was successfully updated"
    click_on "Back"
  end

  test "destroying a Recepcion" do
    visit recepciones_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recepcion was successfully destroyed"
  end
end
