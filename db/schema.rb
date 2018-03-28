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

ActiveRecord::Schema.define(version: 20180328085550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_users", force: :cascade do |t|
    t.string "url", null: false
    t.string "api_key", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["api_key"], name: "index_api_users_on_api_key"
  end

  create_table "ratings", force: :cascade do |t|
    t.string "uid", null: false
    t.bigint "api_user_id", null: false
    t.bigint "sender_id", null: false
    t.bigint "receiver_id", null: false
    t.integer "value", null: false
    t.datetime "created_at", null: false
    t.integer "modification"
    t.datetime "updated_at"
    t.index ["api_user_id"], name: "index_ratings_on_api_user_id"
    t.index ["receiver_id"], name: "index_ratings_on_receiver_id"
    t.index ["sender_id"], name: "index_ratings_on_sender_id"
    t.index ["uid"], name: "index_ratings_on_uid"
  end

  create_table "receivers", force: :cascade do |t|
    t.string "uid", null: false
    t.datetime "created_at", null: false
    t.index ["uid"], name: "index_receivers_on_uid"
  end

  create_table "senders", force: :cascade do |t|
    t.string "uid", null: false
    t.datetime "created_at", null: false
    t.index ["uid"], name: "index_senders_on_uid"
  end

  add_foreign_key "ratings", "api_users"
  add_foreign_key "ratings", "receivers"
  add_foreign_key "ratings", "senders"
end
