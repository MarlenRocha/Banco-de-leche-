class CreateDesechados < ActiveRecord::Migration[5.2]
  def change
    create_table :desechados do |t|

      t.timestamps
    end
  end
end
