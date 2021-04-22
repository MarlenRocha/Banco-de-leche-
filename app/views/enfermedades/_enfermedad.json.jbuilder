json.extract! enfermedad, :id, :nombre, :tratamiento, :tipo, :clasificacion, :nueva, :created_at, :updated_at
json.url enfermedad_url(enfermedad, format: :json)
