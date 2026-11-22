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

ActiveRecord::Schema[8.1].define(version: 2026_11_22_121425) do
  create_table "accessibility_passports", force: :cascade do |t|
    t.float "ramp_angle"
    t.integer "door_width_cm"
    t.boolean "has_elevator"
    t.text "hazard_gutters_note"
    t.integer "place_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_accessibility_passports_on_place_id"
  end

  create_table "disability_types", force: :cascade do |t|
    t.string "name"
    t.string "icon_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "disability_types_places", id: false, force: :cascade do |t|
    t.integer "disability_type_id", null: false
    t.integer "place_id", null: false
  end

  create_table "districts", force: :cascade do |t|
    t.string "name"
    t.string "route_safety_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.boolean "has_ramp"
    t.boolean "has_braille"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "district_id"
    t.index ["district_id"], name: "index_places_on_district_id"
  end

  add_foreign_key "accessibility_passports", "places"
  add_foreign_key "places", "districts"
end
