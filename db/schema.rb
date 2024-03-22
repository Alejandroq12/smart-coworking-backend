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

ActiveRecord::Schema[7.1].define(version: 2024_03_13_214442) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.bigint "state_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "abbrev"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jwt_denylists", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_denylists_on_jti", unique: true
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "space_cw_id", null: false
    t.date "date_reserved"
    t.date "date_cancelled"
    t.date "start_date"
    t.date "end_date"
    t.time "start_time"
    t.time "end_time"
    t.bigint "city_id", null: false
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_reservations_on_city_id"
    t.index ["space_cw_id"], name: "index_reservations_on_space_cw_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "space_cws", force: :cascade do |t|
    t.string "name"
    t.string "model"
    t.text "description"
    t.string "address"
    t.decimal "price"
    t.string "image"
    t.decimal "discount"
    t.string "category"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_space_cws_on_user_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "abbrev"
    t.bigint "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cities", "states"
  add_foreign_key "reservations", "cities"
  add_foreign_key "reservations", "space_cws"
  add_foreign_key "reservations", "users"
  add_foreign_key "space_cws", "users"
  add_foreign_key "states", "countries"
end
