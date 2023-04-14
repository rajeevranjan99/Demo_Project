class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.string :flight_name
      t.integer :port_number
      t.datetime :arrival_time
      t.datetime :departure_time

      t.timestamps
    end
  end
end
