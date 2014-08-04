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

ActiveRecord::Schema.define(version: 20140804203300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "stripe_customer_token"
    t.date     "wedding_date"
    t.integer  "subscription_id"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "designs", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.integer  "layout_id"
  end

  create_table "events", force: true do |t|
    t.datetime "date"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
  end

  create_table "layouts", force: true do |t|
    t.integer  "design_id"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", force: true do |t|
    t.integer  "amount"
    t.string   "interval"
    t.string   "name"
    t.string   "currency"
    t.string   "stripe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.string   "analytics"
    t.boolean  "password_protected"
    t.boolean  "is_indexed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subdomain"
  end

  create_table "stories", force: true do |t|
    t.integer  "site_id"
    t.string   "title"
    t.string   "image"
    t.text     "content"
    t.integer  "display_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", force: true do |t|
    t.string   "plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stripe_customer_token"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.integer  "account_id"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
