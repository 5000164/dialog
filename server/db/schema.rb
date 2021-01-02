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

ActiveRecord::Schema.define(version: 2021_01_02_094018) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "avatars", primary_key: "avatar_id", force: :cascade do |t|
    t.string "name", null: false
    t.string "image_path", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "candidates", primary_key: "candidate_id", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_candidates_on_user_id", unique: true
  end

  create_table "group_topics", id: false, force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "topic_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id", "created_at"], name: "index_group_topics_on_group_id_and_created_at"
    t.index ["group_id", "topic_id"], name: "index_group_topics_on_group_id_and_topic_id", unique: true
  end

  create_table "groups", primary_key: "group_id", force: :cascade do |t|
    t.datetime "expired_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expired_at"], name: "index_groups_on_expired_at"
  end

  create_table "statements", primary_key: "statement_id", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.string "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id", "created_at"], name: "index_statements_on_group_id_and_created_at"
  end

  create_table "topics", primary_key: "topic_id", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.string "content", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_topics_on_group_id"
  end

  create_table "user_groups", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.bigint "avatar_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id", "avatar_id"], name: "index_user_groups_on_group_id_and_avatar_id", unique: true
    t.index ["group_id"], name: "index_user_groups_on_group_id"
    t.index ["user_id", "group_id"], name: "index_user_groups_on_user_id_and_group_id", unique: true
    t.index ["user_id"], name: "index_user_groups_on_user_id"
  end

  create_table "users", primary_key: "user_id", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "candidates", "users", primary_key: "user_id", on_delete: :cascade
  add_foreign_key "group_topics", "groups", primary_key: "group_id", on_delete: :restrict
  add_foreign_key "group_topics", "topics", primary_key: "topic_id", on_delete: :cascade
  add_foreign_key "statements", "groups", primary_key: "group_id", on_delete: :restrict
  add_foreign_key "statements", "users", primary_key: "user_id", on_delete: :cascade
  add_foreign_key "topics", "groups", primary_key: "group_id", on_delete: :restrict
  add_foreign_key "topics", "users", primary_key: "user_id", on_delete: :cascade
  add_foreign_key "user_groups", "avatars", primary_key: "avatar_id", on_delete: :restrict
  add_foreign_key "user_groups", "groups", primary_key: "group_id", on_delete: :restrict
  add_foreign_key "user_groups", "users", primary_key: "user_id", on_delete: :cascade
end
