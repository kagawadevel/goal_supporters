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

ActiveRecord::Schema.define(version: 2020_03_07_044110) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string "title"
    t.text "detail"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_boards_on_group_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "group_id"
    t.bigint "board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["board_id"], name: "index_comments_on_board_id"
    t.index ["group_id"], name: "index_comments_on_group_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string "name"
    t.string "detail"
    t.integer "past"
    t.boolean "finished", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "informed", default: 0
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "group_image"
    t.text "introduce"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "praises", force: :cascade do |t|
    t.bigint "goal_id"
    t.integer "praised"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["goal_id"], name: "index_praises_on_goal_id"
  end

  create_table "timelines", force: :cascade do |t|
    t.text "content"
    t.bigint "group_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "goal_id"
    t.boolean "cheered", default: false
    t.index ["goal_id"], name: "index_timelines_on_goal_id"
    t.index ["group_id"], name: "index_timelines_on_group_id"
    t.index ["user_id"], name: "index_timelines_on_user_id"
  end

  create_table "user_group_relations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_user_group_relations_on_group_id"
    t.index ["user_id"], name: "index_user_group_relations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "profile_image"
    t.text "introduce"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "boards", "groups"
  add_foreign_key "comments", "boards"
  add_foreign_key "comments", "groups"
  add_foreign_key "goals", "users"
  add_foreign_key "praises", "goals"
  add_foreign_key "timelines", "goals"
  add_foreign_key "timelines", "groups"
  add_foreign_key "timelines", "users"
  add_foreign_key "user_group_relations", "groups"
  add_foreign_key "user_group_relations", "users"
end
