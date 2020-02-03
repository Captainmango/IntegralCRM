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

ActiveRecord::Schema.define(version: 20200105132819) do

  create_table "cases", force: :cascade do |t|
    t.integer  "owner"
    t.integer  "client_id"
    t.string   "status"
    t.string   "open_date"
    t.string   "close_date"
    t.string   "add_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: :cascade do |t|
    t.string  "name"
    t.string  "contact_number"
    t.string  "address1"
    t.string  "address2"
    t.string  "city"
    t.string  "postcode"
    t.string  "email"
    t.string  "add_info"
    t.integer "user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.integer  "owner"
    t.integer  "client_id"
    t.integer  "case_id"
    t.string   "title"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "case_id"
    t.integer  "client_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
  end

end
