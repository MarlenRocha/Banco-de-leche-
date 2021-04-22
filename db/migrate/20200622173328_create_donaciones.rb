class CreateDonaciones < ActiveRecord::Migration[5.2]
  def change
    create_table :donaciones do |t|
      t.string :fecha_registro_donacion
      t.references :donadora, foreign_key: true

      t.timestamps
    end
  end
end
