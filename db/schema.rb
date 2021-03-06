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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20141105203410) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "decission_categories", :force => true do |t|
    t.string "title"
  end

  create_table "decissions", :force => true do |t|
    t.string  "title"
    t.integer "decission_category_id"
  end

  add_index "decissions", ["decission_category_id"], :name => "index_decissions_on_decission_category_id"

  create_table "districts", :force => true do |t|
    t.string   "name"
    t.float    "lat"
    t.float    "lng"
    t.integer  "gremium_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "documents", :force => true do |t|
    t.string  "title"
    t.string  "name"
    t.text    "html"
    t.text    "url"
    t.integer "vorlage_id"
  end

  add_index "documents", ["vorlage_id"], :name => "index_documents_on_vorlage_id"

  create_table "gremium", :force => true do |t|
    t.string "title"
    t.string "detail_url"
    t.string "color"
  end

  create_table "gremium_members", :id => false, :force => true do |t|
    t.integer "gremium_id"
    t.integer "member_id"
  end

  create_table "gremium_vorlage", :id => false, :force => true do |t|
    t.integer "gremium_id"
    t.integer "vorlage_id"
  end

  add_index "gremium_vorlage", ["gremium_id"], :name => "index_gremium_vorlage_on_gremium_id"
  add_index "gremium_vorlage", ["vorlage_id"], :name => "index_gremium_vorlage_on_vorlage_id"

  create_table "members", :force => true do |t|
    t.string   "name"
    t.integer  "party_id"
    t.integer  "district_id"
    t.string   "profession"
    t.integer  "age"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "notifications", :force => true do |t|
    t.string   "email"
    t.string   "model"
    t.integer  "model_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "token"
    t.boolean  "authenticated", :default => false
  end

  create_table "parties", :force => true do |t|
    t.string   "name"
    t.string   "alt_names"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pg_search_documents", :force => true do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "sitzung", :force => true do |t|
    t.datetime "datum"
    t.string   "stadt_id"
    t.text     "bezeichnung"
    t.text     "raum"
    t.string   "detail_url"
    t.integer  "gremium_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "sitzung", ["gremium_id"], :name => "index_sitzung_on_gremium_id"

  create_table "sitzung_vorlage", :force => true do |t|
    t.integer "sitzung_id"
    t.integer "vorlage_id"
    t.string  "typ"
    t.boolean "guessed"
    t.integer "decission_id"
  end

  add_index "sitzung_vorlage", ["sitzung_id"], :name => "index_sitzung_vorlage_on_sitzung_id"
  add_index "sitzung_vorlage", ["vorlage_id"], :name => "index_sitzung_vorlage_on_vorlage_id"

  create_table "subjects", :force => true do |t|
    t.string   "title"
    t.integer  "gremium_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "subjects", ["gremium_id"], :name => "index_subjects_on_gremium_id"

  create_table "vorlage", :force => true do |t|
    t.text     "title"
    t.string   "detail_url"
    t.string   "stadt_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "long_title"
    t.datetime "datum"
    t.integer  "zustaendig"
  end

  add_index "vorlage", ["zustaendig"], :name => "index_vorlage_on_zustaendig"

end
