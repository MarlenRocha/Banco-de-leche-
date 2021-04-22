require "application_system_test_case"

class EspecialidadesTest < ApplicationSystemTestCase
  setup do
    @especialidad = especialidades(:one)
  end

  test "visiting the index" do
    visit especialidades_url
    assert_selector "h1", text: "Especialidades"
  end

  test "creating a Especialidad" do
    visit especialidades_url
    click_on "New Especialidad"

    fill_in "Agrupacion", with: @especialidad.agrupacion
    fill_in "Anio", with: @especialidad.anio
    fill_in "Descripcion", with: @especialidad.descripcion
    fill_in "Lugar", with: @especialidad.lugar
    fill_in "Nombre", with: @especialidad.nombre
    fill_in "Orientacion", with: @especialidad.orientacion
    click_on "Create Especialidad"

    assert_text "Especialidad was successfully created"
    click_on "Back"
  end

  test "updating a Especialidad" do
    visit especialidades_url
    click_on "Edit", match: :first

    fill_in "Agrupacion", with: @especialidad.agrupacion
    fill_in "Anio", with: @especialidad.anio
    fill_in "Descripcion", with: @especialidad.descripcion
    fill_in "Lugar", with: @especialidad.lugar
    fill_in "Nombre", with: @especialidad.nombre
    fill_in "Orientacion", with: @especialidad.orientacion
    click_on "Update Especialidad"

    assert_text "Especialidad was successfully updated"
    click_on "Back"
  end

  test "destroying a Especialidad" do
    visit especialidades_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Especialidad was successfully destroyed"
  end
end
