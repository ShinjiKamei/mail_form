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

ActiveRecord::Schema.define(version: 20150616015509) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inquiries", force: true do |t|
    t.string   "email"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "category_id", null: false
  end

  add_index "inquiries", ["created_at"], name: "index_inquiries_on_created_at", using: :btree
  add_index "inquiries", ["email", "created_at"], name: "index_inquiries_on_email_and_created_at", using: :btree

  create_table "responses", force: true do |t|
    t.string   "content"
    t.integer  "inquiry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "responses", ["inquiry_id"], name: "index_responses_on_inquiry_id", using: :btree

end
