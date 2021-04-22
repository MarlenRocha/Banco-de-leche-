class CreateEspecialidades < ActiveRecord::Migration[5.2]
  def change
    create_table :especialidades do |t|
      t.string :nombre
      t.string :descripcion
      t.string :orientacion
      t.string :agrupacion
      t.string :lugar
      t.string :anio

      t.timestamps
    end
  end
end
