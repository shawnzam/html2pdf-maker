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

ActiveRecord::Schema.define(:version => 20120613141641) do

  create_table "urls", :force => true do |t|
    t.string   "url"
    t.integer  "workbook_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "use",         :default => false
  end

  create_table "workbooks", :force => true do |t|
    t.string   "title"
    t.string   "bookmark_file"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "bookmark_file_name"
    t.string   "bookmark_content_type"
    t.integer  "bookmark_file_size"
    t.datetime "bookmark_updated_at"
    t.string   "pdf_file_name"
    t.string   "pdf_content_type"
    t.integer  "pdf_file_size"
    t.datetime "pdf_updated_at"
  end

end
