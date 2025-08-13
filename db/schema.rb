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

ActiveRecord::Schema[8.0].define(version: 2025_08_13_073018) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "clock_ins", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "action_type", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clock_ins_on_user_id"
  end

  create_table "sleep_durations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["duration"], name: "index_sleep_durations_on_duration"
    t.index ["user_id"], name: "index_sleep_durations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_users_on_name", unique: true
  end

  add_foreign_key "clock_ins", "users"
  add_foreign_key "sleep_durations", "users"
end
