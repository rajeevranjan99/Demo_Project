class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.string :flight_name
      t.string :flight_number
      t.belongs_to :airport, null: false, foreign_key: true
  

      t.timestamps
    end
  end
end
