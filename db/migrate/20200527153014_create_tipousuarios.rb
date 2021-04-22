class CreateTipousuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :tipousuarios do |t|

      t.timestamps
    end
  end
end
