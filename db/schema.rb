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

ActiveRecord::Schema.define(version: 2020_05_21_162017) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hikes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "trail_id", null: false
    t.boolean "completed"
    t.boolean "favorite"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trail_id"], name: "index_hikes_on_trail_id"
    t.index ["user_id"], name: "index_hikes_on_user_id"
  end

  create_table "trails", force: :cascade do |t|
    t.string "name"
    t.string "type"
    t.string "summary"
    t.string "difficulty"
    t.string "location"
    t.string "url"
    t.string "img_sq_small"
    t.string "img_small"
    t.string "img_small_med"
    t.string "img_medium"
    t.string "length"
    t.string "ascent"
    t.string "descent"
    t.integer "trail_api_id"
    t.string "condition_status"
    t.string "condition_details"
    t.float "longitude"
    t.float "latitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.integer "outdoorsiness_scale"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "hikes", "trails"
  add_foreign_key "hikes", "users"
end
