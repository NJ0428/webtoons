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

ActiveRecord::Schema[8.0].define(version: 2025_09_13_064623) do
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
    t.string "category", default: "webtoon"
    t.index ["category"], name: "index_comics_on_category"
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

  create_table "novels", force: :cascade do |t|
    t.string "title", null: false
    t.string "author", null: false
    t.text "description"
    t.string "genre", null: false
    t.string "thumbnail_url"
    t.decimal "rating", precision: 3, scale: 2, default: "0.0"
    t.integer "view_count", default: 0
    t.string "status", default: "ongoing"
    t.boolean "is_new", default: false
    t.string "category", default: "novel"
    t.integer "chapter_count", default: 0
    t.string "update_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category"], name: "index_novels_on_category"
    t.index ["genre"], name: "index_novels_on_genre"
    t.index ["rating"], name: "index_novels_on_rating"
    t.index ["status"], name: "index_novels_on_status"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", null: false
    t.string "nickname", null: false
    t.string "phone"
    t.date "birth_date"
    t.string "gender"
    t.string "profile_image"
    t.text "bio"
    t.integer "version", default: 1, null: false
    t.boolean "is_current", default: false, null: false
    t.text "change_reason"
    t.string "changed_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "is_current"], name: "index_user_profiles_on_user_id_and_is_current"
    t.index ["user_id", "version"], name: "index_user_profiles_on_user_id_and_version", unique: true
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
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
  add_foreign_key "user_profiles", "users"
end
