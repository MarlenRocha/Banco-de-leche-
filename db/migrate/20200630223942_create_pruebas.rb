class CreatePruebas < ActiveRecord::Migration[5.2]
  def change
    create_table :pruebas do |t|
      t.string :embalaje
      t.string :color
      t.string :suciedad
      t.string :olor
      t.string :crematocrito
      t.string :kilocalorias
      t.string :proteinas
      t.string :carbohidratos
      t.string :grasas
      t.references :clasificacion, foreign_key: true
      t.string :cantidad_almacenada
      t.string :cantidad_desechada
      t.references :etiqueta, foreign_key: true
      t.string :cantidad

      t.timestamps
    end
  end
end
