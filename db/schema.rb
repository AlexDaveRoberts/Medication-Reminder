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

ActiveRecord::Schema.define(version: 2020_03_02_134717) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "individual_reminders", force: :cascade do |t|
    t.integer "reminder_id"
    t.string "dose1"
    t.datetime "time1"
    t.boolean "taken1"
    t.datetime "taken_at1"
    t.string "dose2"
    t.datetime "time2"
    t.boolean "taken2"
    t.datetime "taken_at2"
    t.string "dose3"
    t.datetime "time3"
    t.boolean "taken3"
    t.datetime "taken_at3"
    t.string "dose4"
    t.datetime "time4"
    t.boolean "taken4"
    t.datetime "taken_at4"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reminders", force: :cascade do |t|
    t.string "medication_name"
    t.string "medication_type"
    t.integer "num_of_times"
    t.datetime "start_date"
    t.string "repeat"
    t.datetime "repeat_until"
    t.text "notes"
    t.integer "individual_reminder_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
