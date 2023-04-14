class AddManagerToSchedules < ActiveRecord::Migration[7.0]
  def change
    add_reference :schedules, :manager, null: false, foreign_key: true
  end
end
