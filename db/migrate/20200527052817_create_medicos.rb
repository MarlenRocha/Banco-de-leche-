class CreateMedicos < ActiveRecord::Migration[5.2]
  def change
    create_table :medicos do |t|
      t.string :nombre
      t.string :paterno
      t.string :materno
      t.string :sexo
      t.string :telefono
      t.string :edad
      t.references :especialidad, foreign_key: true
      t.references :hospital, foreign_key: true
      t.references :nacionalidad, foreign_key: true

      t.timestamps
    end
  end
end
