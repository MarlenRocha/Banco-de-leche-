class CreateRecepciones < ActiveRecord::Migration[5.2]
  def change
    create_table :recepciones do |t|
      t.string :fecha_extraccion
      t.string :cantidad
      t.references :frasco, foreign_key: true
      t.references :area, foreign_key: true

      t.timestamps
    end
  end
end
