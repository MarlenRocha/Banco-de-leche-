require "application_system_test_case"

class DosificacionesTest < ApplicationSystemTestCase
  setup do
    @dosificacion = dosificaciones(:one)
  end

  test "visiting the index" do
    visit dosificaciones_url
    assert_selector "h1", text: "Dosificaciones"
  end

  test "creating a Dosificacion" do
    visit dosificaciones_url
    click_on "New Dosificacion"

    fill_in "Administracion", with: @dosificacion.administracion
    fill_in "Area", with: @dosificacion.area_id
    fill_in "Dosificacion", with: @dosificacion.dosificacion
    fill_in "Etiqueta", with: @dosificacion.etiqueta_id
    fill_in "Fecha dosificacion", with: @dosificacion.fecha_dosificacion
    fill_in "Reciennacido", with: @dosificacion.reciennacido_id
    fill_in "Toma", with: @dosificacion.toma
    click_on "Create Dosificacion"

    assert_text "Dosificacion was successfully created"
    click_on "Back"
  end

  test "updating a Dosificacion" do
    visit dosificaciones_url
    click_on "Edit", match: :first

    fill_in "Administracion", with: @dosificacion.administracion
    fill_in "Area", with: @dosificacion.area_id
    fill_in "Dosificacion", with: @dosificacion.dosificacion
    fill_in "Etiqueta", with: @dosificacion.etiqueta_id
    fill_in "Fecha dosificacion", with: @dosificacion.fecha_dosificacion
    fill_in "Reciennacido", with: @dosificacion.reciennacido_id
    fill_in "Toma", with: @dosificacion.toma
    click_on "Update Dosificacion"

    assert_text "Dosificacion was successfully updated"
    click_on "Back"
  end

  test "destroying a Dosificacion" do
    visit dosificaciones_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dosificacion was successfully destroyed"
  end
end
