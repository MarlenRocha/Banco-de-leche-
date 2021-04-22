class CreateFrascos < ActiveRecord::Migration[5.2]
  def change
    create_table :frascos do |t|

      t.timestamps
    end
  end
end
