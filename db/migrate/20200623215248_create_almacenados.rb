class CreateAlmacenados < ActiveRecord::Migration[5.2]
  def change
    create_table :almacenados do |t|

      t.timestamps
    end
  end
end
