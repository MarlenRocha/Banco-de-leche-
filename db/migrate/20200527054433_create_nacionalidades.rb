class CreateNacionalidades < ActiveRecord::Migration[5.2]
  def change
    create_table :nacionalidades do |t|
      t.string :nombre
      t.string :descripcion
      t.string :tipo
      t.string :espacio_geografico
      t.string :territorio
      t.string :estado

      t.timestamps
    end
  end
end
