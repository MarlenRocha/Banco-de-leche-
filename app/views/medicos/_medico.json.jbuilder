json.extract! medico, :id, :nombre, :paterno, :materno, :sexo, :telefono, :edad, :especialidad_id, :hospital_id, :nacionalidad_id, :created_at, :updated_at
json.url medico_url(medico, format: :json)
