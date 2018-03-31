# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180311042246) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_careers", force: :cascade, comment: "ゲーム経歴" do |t|
    t.bigint "profile_id", null: false, comment: "プロフィールID"
    t.string "name", null: false, comment: "経歴"
    t.index ["profile_id"], name: "index_game_careers_on_profile_id"
  end

  create_table "game_consoles", force: :cascade, comment: "ゲーム機" do |t|
    t.string "name", null: false, comment: "ゲーム機名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_game_consoles_on_name", unique: true
  end

  create_table "possess_games", force: :cascade, comment: "所持ゲーム機" do |t|
    t.bigint "profile_id", null: false, comment: "プロフィールID"
    t.bigint "game_console_id", null: false, comment: "ゲーム機ID"
    t.index ["game_console_id"], name: "index_possess_games_on_game_console_id"
    t.index ["profile_id"], name: "index_possess_games_on_profile_id"
  end

  create_table "prefectures", force: :cascade, comment: "都道府県" do |t|
    t.string "name", null: false, comment: "都道府県名"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false, comment: "ユーザーID"
    t.string "email", comment: "メールアドレス"
    t.bigint "prefecture_id", null: false, comment: "都道府県"
    t.string "city", comment: "区市町村"
    t.string "tell", null: false, comment: "電話番号"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prefecture_id"], name: "index_profiles_on_prefecture_id"
    t.index ["user_id"], name: "index_profiles_on_user_id", unique: true
  end

  create_table "users", force: :cascade, comment: "ユーザー" do |t|
    t.string "name", null: false, comment: "ユーザー名"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "profiles", "users"
end
