class CreateHospitales < ActiveRecord::Migration[5.2]
  def change
    create_table :hospitales do |t|

      t.timestamps
    end
  end
end
