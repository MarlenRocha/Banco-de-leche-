Rails.application.routes.draw do

  resources :pruebas
  root :to => 'sesiones#login'
  resources :dosificaciones
  resources :pasteurizaciones
  resources :analisisregistros
  #get 'analisis/registros'
  resources :recepciones
  #resources :frascos
  #get 'sesiones/login'
  
  resources :donaciones
  resources :usuarios
  #get 'tipousuarios/inicio'
  #get 'donadoras/inicio'
  #get 'hospitales/inicio'
  #get 'clasificaciones/inicio'
  #get 'areas/inicio'
  resources :enfermedades
  resources :especialidades
  resources :nacionalidades
  resources :medicos
  resources :reciennacidos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  match '/areas' => 'areas#inicio', via: :get, :as => :areas_inicio
  match '/area/nuevo' => 'areas#nuevo', via: :get, :as => :area_nuevo
  match '/area/crear' => 'areas#crear', via: :post, :as => :area_crear
  match '/area/:id/mostrar' => 'areas#mostrar', via: :get, :as => :area_mostrar
  match '/area/:id/editar' => 'areas#editar', via: :get, :as => :area_editar
  match '/area/actualizar' => 'areas#actualizar', via: :patch, :as => :area_actualizar
  match '/area/:id/eliminar' => 'areas#eliminar', via: :delete,:as =>:area_eliminar
  match '/buscar_area' => 'areas#inicio', via: :post, :as => :buscar_area

  match '/clasificaciones' => 'clasificaciones#inicio', via: :get, :as => :clasificaciones_inicio
  match '/clasificacion/nuevo' => 'clasificaciones#nuevo', via: :get, :as => :clasificacion_nuevo
  match '/clasificacion/crear' => 'clasificaciones#crear', via: :post, :as => :clasificacion_crear
  match '/clasificacion/:id/mostrar' => 'clasificaciones#mostrar', via: :get, :as => :clasificacion_mostrar
  match '/clasificacion/:id/editar' => 'clasificaciones#editar', via: :get, :as => :clasificacion_editar
  match '/clasificacion/actualizar' => 'clasificaciones#actualizar', via: :patch, :as => :clasificacion_actualizar
  match '/clasificacion/:id/eliminar' => 'clasificaciones#eliminar', via: :delete,:as =>:clasificacion_eliminar
  match '/buscar_clasificacion' => 'clasificaciones#inicio', via: :post, :as => :buscar_clasificacion

  match '/hospitales' => 'hospitales#inicio', via: :get, :as => :hospitales_inicio
  match '/hospital/nuevo' => 'hospitales#nuevo', via: :get, :as => :hospital_nuevo
  match '/hospital/crear' => 'hospitales#crear', via: :post, :as => :hospital_crear
  match '/hospital/:id/mostrar' => 'hospitales#mostrar', via: :get, :as => :hospital_mostrar
  match '/hospital/:id/editar' => 'hospitales#editar', via: :get, :as => :hospital_editar
  match '/hospital/actualizar' => 'hospitales#actualizar', via: :patch, :as => :hospital_actualizar
  match '/hospital/:id/eliminar' => 'hospitales#eliminar', via: :delete,:as =>:hospital_eliminar
  match '/buscar_hospital' => 'hospitales#inicio', via: :post, :as => :buscar_hospital

  match '/donadoras' => 'donadoras#inicio', via: :get, :as => :donadoras_inicio
  match '/donadora/nuevo' => 'donadoras#nuevo', via: :get, :as => :donadora_nuevo
  match '/donadora/crear' => 'donadoras#crear', via: :post, :as => :donadora_crear
  match '/donadora/:id/mostrar' => 'donadoras#mostrar', via: :get, :as => :donadora_mostrar
  match '/donadora/:id/editar' => 'donadoras#editar', via: :get, :as => :donadora_editar
  match '/donadora/actualizar' => 'donadoras#actualizar', via: :patch, :as => :donadora_actualizar
  match '/donadora/:id/eliminar' => 'donadoras#eliminar', via: :delete,:as =>:donadora_eliminar
  match '/buscar_donadora' => 'donadoras#inicio', via: :post, :as => :buscar_donadora


  match '/tipousuarios' => 'tipousuarios#inicio', via: :get, :as => :tipousuarios_inicio
  match '/tipousuario/nuevo' => 'tipousuarios#nuevo', via: :get, :as => :tipousuario_nuevo
  match '/tipousuario/crear' => 'tipousuarios#crear', via: :post, :as => :tipousuario_crear
  match '/tipousuario/:id/mostrar' => 'tipousuarios#mostrar', via: :get, :as => :tipousuario_mostrar
  match '/tipousuario/:id/editar' => 'tipousuarios#editar', via: :get, :as => :tipousuario_editar
  match '/tipousuario/actualizar' => 'tipousuarios#actualizar', via: :patch, :as => :tipousuario_actualizar
  match '/tipousuario/:id/eliminar' => 'tipousuarios#eliminar', via: :delete,:as =>:tipousuario_eliminar
  match '/buscar_tipousuario' => 'tipousuarios#inicio', via: :post, :as => :buscar_tipousuario

  #rutas de busqueda para los catalogos hechos con scaffold
  match '/buscar_enfermedad' => 'enfermedades#index', via: :post, :as => :buscar_enfermedad
  match '/buscar_especialidad' => 'especialidades#index', via: :post, :as => :buscar_especialidad
  match '/buscar_medico' => 'medicos#index', via: :post, :as => :buscar_medico
  match '/buscar_nacionalidad' => 'nacionalidades#index', via: :post, :as => :buscar_nacionalidad
  match '/buscar_reciennacido' => 'reciennacidos#index', via: :post, :as => :buscar_reciennacido
  match '/buscar_usuario' => 'usuarios#index', via: :post, :as => :buscar_usuario
  match '/buscar_donacion' => 'donaciones#index', via: :post, :as => :buscar_donacion
  match '/buscar_recepcion' => 'recepciones#index', via: :post, :as => :buscar_recepcion

  
  match '/etiqueta/:id/mostrar' => 'etiquetas#mostrar', via: :get, :as => :etiqueta_mostrar
  match '/etiquetadonacion/:id/mostrar' => 'etiquetadonaciones#mostrar', via: :get, :as => :etiquetadonacion_mostrar

  match '/ver_informe' => 'informes#ver_informe', via: :get, :as => :ver_informe
  #match '/frasco/:id/mostrar' => 'frascos#mostrar', via: :get, :as => :frasco_mostrar
  #match '/frasco/:id/veretiqueta' => 'frascos#veretiqueta', via: :get, :as => :frasco_veretiqueta
  #match '/frasco/nuevo' => 'frascos#nuevo', via: :get, :as => :frasco_nuevo
  #match '/frasco/crear' => 'frascos#crear', via: :post, :as => :frasco_crear

  match '/validar_curp_reciennacido' => 'reciennacidos#validar_curp', via: :get, :as => :validar_curp_reciennacido
  match '/validar_curp_donadora' => 'donadoras#validar_curp', via: :get, :as => :validar_curp_donadora

  match '/validar_rfc' => 'usuarios#validar_rfc', via: :get, :as => :validar_rfc_usuario
  match '/validar_curp' => 'usuarios#validar_curp', via: :get, :as => :validar_curp_usuario
  match '/validar_correo' => 'usuarios#validar_correo', via: :get, :as => :validar_correo_usuario

  match '/login' => 'sesiones#login', via: :get, :as => :login
  match '/validar_usuario' => 'sesiones#validar_usuario', via: :post, :as => :validar_usuario

  match '/cerrar_sesion' => 'sesiones#cerrar_sesion', via: :get, :as => :cerrar_sesion
end
