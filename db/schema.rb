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

ActiveRecord::Schema.define(version: 20150425234413) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_contractors", id: false, force: :cascade do |t|
    t.integer "contractor_id"
    t.integer "category_id"
  end

  add_index "categories_contractors", ["category_id"], name: "index_categories_contractors_on_category_id", using: :btree
  add_index "categories_contractors", ["contractor_id"], name: "index_categories_contractors_on_contractor_id", using: :btree

  create_table "contractors", force: :cascade do |t|
    t.string   "email",                        default: "", null: false
    t.string   "encrypted_password",           default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "name"
    t.string   "phone"
    t.string   "website"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
  end

  add_index "contractors", ["email"], name: "index_contractors_on_email", unique: true, using: :btree
  add_index "contractors", ["reset_password_token"], name: "index_contractors_on_reset_password_token", unique: true, using: :btree

  create_table "projects", force: :cascade do |t|
    t.integer  "contractor_id"
    t.string   "title"
    t.string   "description"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "projects", ["contractor_id"], name: "index_projects_on_contractor_id", using: :btree

end
