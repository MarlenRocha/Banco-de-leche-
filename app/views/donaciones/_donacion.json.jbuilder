json.extract! donacion, :id, :fecha_registro_donacion, :donadora_id, :created_at, :updated_at
json.url donacion_url(donacion, format: :json)
