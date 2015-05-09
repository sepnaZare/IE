# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150509075301) do

  create_table "availables", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "item_count"
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "store_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "price"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "item_type"
    t.string   "item_company"
    t.string   "item_code"
    t.string   "item_image"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "ssn"
    t.string   "email"
    t.string   "mobile"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "avatar"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "date"
    t.string   "total_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shoppings", force: :cascade do |t|
    t.integer  "usage_id"
    t.integer  "purchase_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "tag_id"
  end

  create_table "stores", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "company_name"
    t.string   "economic_code"
    t.string   "national_id"
    t.string   "register_number"
    t.string   "telephone_number1"
    t.string   "telephone_number2"
    t.string   "company_address"
    t.integer  "user_id"
    t.integer  "current_item_id"
    t.string   "store_image"
  end

  create_table "tags", force: :cascade do |t|
    t.integer  "item_id"
    t.boolean  "is_sold"
    t.string   "tag_serial"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "store_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
