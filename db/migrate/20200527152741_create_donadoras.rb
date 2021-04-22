class CreateDonadoras < ActiveRecord::Migration[5.2]
  def change
    create_table :donadoras do |t|

      t.timestamps
    end
  end
end
