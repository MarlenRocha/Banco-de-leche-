require "application_system_test_case"

class EnfermedadesTest < ApplicationSystemTestCase
  setup do
    @enfermedad = enfermedades(:one)
  end

  test "visiting the index" do
    visit enfermedades_url
    assert_selector "h1", text: "Enfermedades"
  end

  test "creating a Enfermedad" do
    visit enfermedades_url
    click_on "New Enfermedad"

    fill_in "Clasificacion", with: @enfermedad.clasificacion
    fill_in "Nombre", with: @enfermedad.nombre
    fill_in "Nueva", with: @enfermedad.nueva
    fill_in "Tipo", with: @enfermedad.tipo
    fill_in "Tratamiento", with: @enfermedad.tratamiento
    click_on "Create Enfermedad"

    assert_text "Enfermedad was successfully created"
    click_on "Back"
  end

  test "updating a Enfermedad" do
    visit enfermedades_url
    click_on "Edit", match: :first

    fill_in "Clasificacion", with: @enfermedad.clasificacion
    fill_in "Nombre", with: @enfermedad.nombre
    fill_in "Nueva", with: @enfermedad.nueva
    fill_in "Tipo", with: @enfermedad.tipo
    fill_in "Tratamiento", with: @enfermedad.tratamiento
    click_on "Update Enfermedad"

    assert_text "Enfermedad was successfully updated"
    click_on "Back"
  end

  test "destroying a Enfermedad" do
    visit enfermedades_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Enfermedad was successfully destroyed"
  end
end
