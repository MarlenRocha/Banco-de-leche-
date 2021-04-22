require "application_system_test_case"

class MedicosTest < ApplicationSystemTestCase
  setup do
    @medico = medicos(:one)
  end

  test "visiting the index" do
    visit medicos_url
    assert_selector "h1", text: "Medicos"
  end

  test "creating a Medico" do
    visit medicos_url
    click_on "New Medico"

    fill_in "Edad", with: @medico.edad
    fill_in "Especialidad", with: @medico.especialidad_id
    fill_in "Hospital", with: @medico.hospital_id
    fill_in "Materno", with: @medico.materno
    fill_in "Nacionalidad", with: @medico.nacionalidad_id
    fill_in "Nombre", with: @medico.nombre
    fill_in "Paterno", with: @medico.paterno
    fill_in "Sexo", with: @medico.sexo
    fill_in "Telefono", with: @medico.telefono
    click_on "Create Medico"

    assert_text "Medico was successfully created"
    click_on "Back"
  end

  test "updating a Medico" do
    visit medicos_url
    click_on "Edit", match: :first

    fill_in "Edad", with: @medico.edad
    fill_in "Especialidad", with: @medico.especialidad_id
    fill_in "Hospital", with: @medico.hospital_id
    fill_in "Materno", with: @medico.materno
    fill_in "Nacionalidad", with: @medico.nacionalidad_id
    fill_in "Nombre", with: @medico.nombre
    fill_in "Paterno", with: @medico.paterno
    fill_in "Sexo", with: @medico.sexo
    fill_in "Telefono", with: @medico.telefono
    click_on "Update Medico"

    assert_text "Medico was successfully updated"
    click_on "Back"
  end

  test "destroying a Medico" do
    visit medicos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Medico was successfully destroyed"
  end
end
