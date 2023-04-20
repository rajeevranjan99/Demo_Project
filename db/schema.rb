# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_18_075743) do
  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "admin_name"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_admins_on_user_id"
  end

  create_table "airports", force: :cascade do |t|
    t.string "airport_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "executives", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flights", force: :cascade do |t|
    t.string "flight_name"
    t.string "flight_number"
    t.integer "airport_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "arrival_time"
    t.datetime "departure_time"
    t.index ["airport_id"], name: "index_flights_on_airport_id"
  end

  create_table "flights_ports", id: false, force: :cascade do |t|
    t.integer "port_id", null: false
    t.integer "flight_id", null: false
  end

  create_table "managers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "phone_number"
    t.string "address"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_managers_on_user_id"
  end

  create_table "ports", force: :cascade do |t|
    t.string "port_number"
    t.integer "airport_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airport_id"], name: "index_ports_on_airport_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "flight_name"
    t.integer "port_number"
    t.datetime "arrival_time"
    t.datetime "departure_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "port_id", null: false
    t.integer "flight_id", null: false
    t.integer "manager_id", null: false
    t.index ["flight_id"], name: "index_schedules_on_flight_id"
    t.index ["manager_id"], name: "index_schedules_on_manager_id"
    t.index ["port_id"], name: "index_schedules_on_port_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "admins", "users"
  add_foreign_key "flights", "airports"
  add_foreign_key "managers", "users"
  add_foreign_key "ports", "airports"
  add_foreign_key "schedules", "flights"
  add_foreign_key "schedules", "managers"
  add_foreign_key "schedules", "ports"
end
