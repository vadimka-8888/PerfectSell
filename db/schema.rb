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

ActiveRecord::Schema[7.0].define(version: 2022_12_28_170504) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bargains", force: :cascade do |t|
    t.bigint "offer_id", null: false
    t.bigint "store_id", null: false
    t.string "status", default: "Considering", null: false
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_bargains_on_offer_id"
    t.index ["store_id"], name: "index_bargains_on_store_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string "name", null: false
    t.string "measure"
    t.decimal "price", null: false
    t.text "description"
    t.boolean "is_active", default: true, null: false
    t.text "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "proposer_id", null: false
    t.index ["proposer_id"], name: "index_offers_on_proposer_id"
  end

  create_table "proposers", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.text "additional_information"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "name", null: false
    t.string "address"
    t.text "description"
    t.string "store_email", null: false
    t.string "store_password", null: false
    t.text "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bargains", "offers"
  add_foreign_key "bargains", "stores"
  add_foreign_key "offers", "proposers"
end
