class CreateDosificaciones < ActiveRecord::Migration[5.2]
  def change
    create_table :dosificaciones do |t|
      t.string :fecha_dosificacion
      t.string :dosificacion
      t.string :toma
      t.string :administracion
      t.references :reciennacido, foreign_key: true
      t.references :area, foreign_key: true
      t.references :etiqueta, foreign_key: true

      t.timestamps
    end
  end
end
