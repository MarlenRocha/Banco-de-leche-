json.extract! recepcion, :id, :fecha_extraccion, :cantidad, :frasco_id, :area_id, :created_at, :updated_at
json.url recepcion_url(recepcion, format: :json)
