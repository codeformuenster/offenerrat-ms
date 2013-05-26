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

ActiveRecord::Schema.define(:version => 20130526063614) do

  create_table "gremium", :force => true do |t|
    t.string "title"
    t.string "detail_url"
  end

  create_table "gremium_vorlage", :id => false, :force => true do |t|
    t.integer "gremium_id"
    t.integer "vorlage_id"
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

  create_table "sitzung_vorlage", :id => false, :force => true do |t|
    t.integer "sitzung_id"
    t.integer "vorlage_id"
    t.string  "typ"
  end

  create_table "subjects", :force => true do |t|
    t.string   "title"
    t.integer  "gremium_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "vorlage", :force => true do |t|
    t.text     "title"
    t.string   "detail_url"
    t.string   "stadt_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "zustaendig"
    t.text     "long_title"
  end

  create_table "vorlagen", :id => false, :force => true do |t|
    t.integer "id",       :null => false
    t.text    "titel"
    t.text    "url"
    t.integer "stadt_id"
  end

end
