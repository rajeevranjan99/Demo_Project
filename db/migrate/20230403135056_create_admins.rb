class CreateAdmins < ActiveRecord::Migration[7.0]
  def change
    create_table :admins do |t|
      t.string :admin_name
      #t.belongs_to :airport, null: false, foreign_key: true
      t.references :user, null: false,foreign_key: true
      t.timestamps
    end
  end
end
