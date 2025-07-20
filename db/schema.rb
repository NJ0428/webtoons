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

ActiveRecord::Schema[8.0].define(version: 2025_07_19_131805) do
  create_table "comics", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "day_of_week", null: false
    t.string "genre"
    t.string "thumbnail_url"
    t.boolean "is_new", default: false
    t.string "status", default: "ongoing"
    t.decimal "rating", precision: 3, scale: 2, default: "0.0"
    t.integer "view_count", default: 0
    t.index ["day_of_week"], name: "index_comics_on_day_of_week"
    t.index ["genre"], name: "index_comics_on_genre"
    t.index ["status"], name: "index_comics_on_status"
  end

  create_table "episodes", force: :cascade do |t|
    t.string "title"
    t.integer "episode_number"
    t.integer "comic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comic_id"], name: "index_episodes_on_comic_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nickname"
    t.string "phone"
    t.date "birth_date"
    t.string "gender"
    t.string "profile_image"
    t.text "bio"
    t.string "salt"
  end

  add_foreign_key "episodes", "comics"
end
