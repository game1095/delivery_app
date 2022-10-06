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

ActiveRecord::Schema[7.0].define(version: 2022_10_05_045800) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branch_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.string "north"
    t.string "south"
    t.string "west"
    t.string "east"
    t.text "important_place"
    t.text "important_road"
    t.text "geography"
    t.bigint "branch_type_id"
    t.bigint "post_office_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_type_id"], name: "index_branches_on_branch_type_id"
    t.index ["post_office_id"], name: "index_branches_on_post_office_id"
  end

  create_table "points", force: :cascade do |t|
    t.string "delivery_point"
    t.string "section"
    t.string "house_number"
    t.string "moo"
    t.string "village"
    t.string "road"
    t.string "sub_district"
    t.string "district"
    t.string "province"
    t.string "landmark"
    t.bigint "branch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["branch_id"], name: "index_points_on_branch_id"
  end

  create_table "post_offices", force: :cascade do |t|
    t.string "name"
    t.string "post_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "full_name"
    t.string "identification"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "post_office_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["post_office_id"], name: "index_users_on_post_office_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "branches", "branch_types"
  add_foreign_key "branches", "post_offices"
  add_foreign_key "points", "branches"
  add_foreign_key "users", "post_offices"
end
