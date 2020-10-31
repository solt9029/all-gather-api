# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_11_042429) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "schedule_dates", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "schedule_id", null: false
    t.date "date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["schedule_id", "date"], name: "index_schedule_dates_on_schedule_id_and_date", unique: true
    t.index ["schedule_id"], name: "index_schedule_dates_on_schedule_id"
  end

  create_table "schedule_member_schedule_dates", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "schedule_date_id", null: false
    t.uuid "schedule_member_id", null: false
    t.date "date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["schedule_date_id", "schedule_member_id", "date"], name: "index_schedule_member_schedule_dates", unique: true
    t.index ["schedule_date_id"], name: "index_schedule_member_schedule_dates_on_schedule_date_id"
    t.index ["schedule_member_id"], name: "index_schedule_member_schedule_dates_on_schedule_member_id"
  end

  create_table "schedule_members", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "schedule_id", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["schedule_id", "name"], name: "index_schedule_members_on_schedule_id_and_name", unique: true
    t.index ["schedule_id"], name: "index_schedule_members_on_schedule_id"
  end

  create_table "schedules", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "schedule_dates", "schedules"
  add_foreign_key "schedule_member_schedule_dates", "schedule_dates"
  add_foreign_key "schedule_member_schedule_dates", "schedule_members"
  add_foreign_key "schedule_members", "schedules"
end
