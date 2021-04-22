class CreateReciennacidos < ActiveRecord::Migration[5.2]
  def change
    create_table :reciennacidos do |t|
      t.string :nombre_madre
      t.string :edad_madre
      t.string :descripcion
      t.string :peso
      t.string :fecha_nacimiento
      t.string :altura
      t.references :enfermedad, foreign_key: true
      t.references :area, foreign_key: true
      t.references :medico, foreign_key: true

      t.timestamps
    end
  end
end
