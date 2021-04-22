class CreateEtiquetas < ActiveRecord::Migration[5.2]
  def change
    create_table :etiquetas do |t|

      t.timestamps
    end
  end
end
