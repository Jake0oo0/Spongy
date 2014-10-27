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

ActiveRecord::Schema.define(version: 20141027005553) do

  create_table "authors", force: true do |t|
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "plugin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plugin_files", force: true do |t|
    t.string   "name"
    t.string   "mc_version"
    t.text     "changelog"
    t.text     "notes"
    t.integer  "plugin_id"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "downloads",    default: 0
    t.string   "release_type"
    t.boolean  "approved",     default: false
  end

  create_table "plugin_pages", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "plugin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plugins", force: true do |t|
    t.string   "name"
    t.text     "body"
    t.string   "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "downloads",        default: 0
    t.integer  "views",            default: 0
    t.boolean  "allow_comments",   default: true
    t.string   "license"
    t.string   "custom_license"
    t.string   "custom_text"
    t.string   "primary_category"
    t.string   "gender"
    t.string   "location"
    t.boolean  "approved",         default: false
    t.boolean  "denied",           default: false
  end

  create_table "registration_tokens", force: true do |t|
    t.string   "uuid"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",         null: false
    t.string   "encrypted_password",     default: "",         null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,          null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.boolean  "admin",                  default: false
    t.string   "mc_uuid"
    t.string   "mc_username"
    t.text     "about"
    t.string   "github"
    t.string   "location"
    t.string   "gender"
    t.string   "avatar_serve",           default: "Gravatar"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
