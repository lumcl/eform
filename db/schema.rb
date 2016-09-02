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

ActiveRecord::Schema.define(version: 20160902035423) do

  create_table "reimbursement", id: false, force: :cascade do |t|
    t.string   "uuid",                                 null: false
    t.string   "name"
    t.string   "bukrs"
    t.string   "belnr"
    t.string   "gjahr"
    t.string   "blart"
    t.datetime "budat"
    t.datetime "bldat"
    t.string   "waers"
    t.float    "wrbtr",                  default: 0.0
    t.string   "subject"
    t.text     "body"
    t.boolean  "approved",   limit: nil
    t.string   "status"
    t.boolean  "deleted",    limit: nil
    t.string   "owner_id"
    t.string   "creator_id"
    t.string   "updater_id"
    t.string   "creator_ip"
    t.string   "updater_ip"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "reimbursement", ["name"], name: "index_reimbursement_on_name"
  add_index "reimbursement", ["uuid"], name: "index_reimbursement_on_uuid", unique: true

  create_table "users", id: false, force: :cascade do |t|
    t.string   "uuid",                                            null: false
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",                 default: ""
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       precision: 38, default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "company"
    t.string   "role"
    t.string   "job_title"
    t.string   "job_level"
    t.string   "region"
    t.string   "factory"
    t.string   "product_line"
    t.string   "cost_center"
    t.string   "waers"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["uuid"], name: "index_users_on_uuid", unique: true

end
