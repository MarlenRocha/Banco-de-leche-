require "application_system_test_case"

class ReciennacidosTest < ApplicationSystemTestCase
  setup do
    @reciennacido = reciennacidos(:one)
  end

  test "visiting the index" do
    visit reciennacidos_url
    assert_selector "h1", text: "Reciennacidos"
  end

  test "creating a Reciennacido" do
    visit reciennacidos_url
    click_on "New Reciennacido"

    fill_in "Altura", with: @reciennacido.altura
    fill_in "Area", with: @reciennacido.area_id
    fill_in "Descripcion", with: @reciennacido.descripcion
    fill_in "Edad madre", with: @reciennacido.edad_madre
    fill_in "Enfermedad", with: @reciennacido.enfermedad_id
    fill_in "Fecha nacimiento", with: @reciennacido.fecha_nacimiento
    fill_in "Medico", with: @reciennacido.medico_id
    fill_in "Nombre madre", with: @reciennacido.nombre_madre
    fill_in "Peso", with: @reciennacido.peso
    click_on "Create Reciennacido"

    assert_text "Reciennacido was successfully created"
    click_on "Back"
  end

  test "updating a Reciennacido" do
    visit reciennacidos_url
    click_on "Edit", match: :first

    fill_in "Altura", with: @reciennacido.altura
    fill_in "Area", with: @reciennacido.area_id
    fill_in "Descripcion", with: @reciennacido.descripcion
    fill_in "Edad madre", with: @reciennacido.edad_madre
    fill_in "Enfermedad", with: @reciennacido.enfermedad_id
    fill_in "Fecha nacimiento", with: @reciennacido.fecha_nacimiento
    fill_in "Medico", with: @reciennacido.medico_id
    fill_in "Nombre madre", with: @reciennacido.nombre_madre
    fill_in "Peso", with: @reciennacido.peso
    click_on "Update Reciennacido"

    assert_text "Reciennacido was successfully updated"
    click_on "Back"
  end

  test "destroying a Reciennacido" do
    visit reciennacidos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reciennacido was successfully destroyed"
  end
end
