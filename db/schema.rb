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

ActiveRecord::Schema.define(:version => 20120104025652) do

  create_table "events", :force => true do |t|
    t.integer  "program_id"
    t.string   "event_status"
    t.string   "event_is_program"
    t.string   "event_name"
    t.string   "rating"
    t.text     "pricing"
    t.text     "description"
    t.text     "trip_info"
    t.text     "gear_list"
    t.text     "confirmation_page"
    t.text     "question1"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "registrar_id"
  end

  create_table "imports", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registrations", :force => true do |t|
    t.integer  "user_id",         :null => false
    t.integer  "event_id",        :null => false
    t.string   "register_status"
    t.string   "need_ride"
    t.integer  "can_take"
    t.string   "leaving_from"
    t.string   "leave_time"
    t.string   "returning_to"
    t.string   "return_time"
    t.text     "gear_answer"
    t.text     "answer1"
    t.text     "has_questions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "experience"
    t.string   "persistence_token",                  :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_type"
    t.boolean  "member"
    t.text     "emergency_contact"
    t.text     "exercise"
    t.text     "medical"
    t.text     "diet"
    t.boolean  "leader_request"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
  end

end
