class AddPortToSchedules < ActiveRecord::Migration[7.0]
  def change
    add_reference :schedules, :port, null: false, foreign_key: true
  end
end
