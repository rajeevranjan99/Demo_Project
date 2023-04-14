class CreatePorts < ActiveRecord::Migration[7.0]
  def change
    create_table :ports do |t|
      t.string :port_number
      t.belongs_to :airport, null: false, foreign_key: true

      t.timestamps
    end
  end
end
