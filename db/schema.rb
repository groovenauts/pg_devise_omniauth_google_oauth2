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

ActiveRecord::Schema.define(version: 20160418022421) do

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false, :comment => ""
    t.string   "encrypted_password",     :default => "", :null => false, :comment => ""
    t.string   "reset_password_token",                                   :comment => ""
    t.datetime "reset_password_sent_at",                                 :comment => ""
    t.datetime "remember_created_at",                                    :comment => ""
    t.integer  "sign_in_count",          :default => 0,  :null => false, :comment => ""
    t.datetime "current_sign_in_at",                                     :comment => ""
    t.datetime "last_sign_in_at",                                        :comment => ""
    t.inet     "current_sign_in_ip",                                     :comment => ""
    t.inet     "last_sign_in_ip",                                        :comment => ""
    t.datetime "created_at",                             :null => false, :comment => ""
    t.datetime "updated_at",                             :null => false, :comment => ""
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
