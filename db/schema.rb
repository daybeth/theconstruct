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

ActiveRecord::Schema.define(version: 20170301032859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.integer  "project_id"
    t.integer  "ninja_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["ninja_id"], name: "index_comments_on_ninja_id", using: :btree
  add_index "comments", ["project_id"], name: "index_comments_on_project_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.string   "content"
    t.integer  "ninja_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "receiver_id"
  end

  add_index "messages", ["ninja_id"], name: "index_messages_on_ninja_id", using: :btree
  add_index "messages", ["receiver_id"], name: "index_messages_on_receiver_id", using: :btree

  create_table "ninjas", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "ninja_name"
    t.string   "location"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "email"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "stack"
    t.integer  "progress"
    t.integer  "ninja_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "projects", ["ninja_id"], name: "index_projects_on_ninja_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.integer  "ninja_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teams", ["ninja_id"], name: "index_teams_on_ninja_id", using: :btree
  add_index "teams", ["project_id"], name: "index_teams_on_project_id", using: :btree

  add_foreign_key "comments", "ninjas"
  add_foreign_key "comments", "projects"
  add_foreign_key "messages", "ninjas"
  add_foreign_key "projects", "ninjas"
  add_foreign_key "teams", "ninjas"
  add_foreign_key "teams", "projects"
end
