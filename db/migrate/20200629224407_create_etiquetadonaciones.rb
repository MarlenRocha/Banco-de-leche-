class CreateEtiquetadonaciones < ActiveRecord::Migration[5.2]
  def change
    create_table :etiquetadonaciones do |t|

      t.timestamps
    end
  end
end
