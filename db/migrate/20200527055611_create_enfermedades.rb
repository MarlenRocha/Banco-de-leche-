class CreateEnfermedades < ActiveRecord::Migration[5.2]
  def change
    create_table :enfermedades do |t|
      t.string :nombre
      t.string :tratamiento
      t.string :tipo
      t.string :clasificacion
      t.string :nueva

      t.timestamps
    end
  end
end
