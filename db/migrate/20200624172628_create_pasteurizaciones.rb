class CreatePasteurizaciones < ActiveRecord::Migration[5.2]
  def change
    create_table :pasteurizaciones do |t|
      t.string :pasteurizacion
      t.references :etiqueta, foreign_key: true
      t.string :cantidad_almacenada
      t.string :cantidad_desechada
      t.string :acidez_dornic
      t.string :cantidad
      
      t.timestamps
    end
  end
end
