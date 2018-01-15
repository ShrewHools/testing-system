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

ActiveRecord::Schema.define(version: 20180115012329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer  "question_id"
    t.string   "answer"
    t.boolean  "correct",     default: false
    t.boolean  "incorrect",   default: false
    t.integer  "test_id"
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["question_id"], name: "index_answers_on_question_id", using: :btree
    t.index ["test_id"], name: "index_answers_on_test_id", using: :btree
    t.index ["user_id"], name: "index_answers_on_user_id", using: :btree
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "subject_id"
    t.text     "body"
    t.string   "correct_answer"
    t.string   "correct_answer_variants",   default: [],              array: true
    t.string   "incorrect_answer_variants", default: [],              array: true
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "theme"
    t.text     "literature"
    t.index ["subject_id"], name: "index_questions_on_subject_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
  end

  create_table "statistics", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "test_id"
    t.integer  "questions_count"
    t.integer  "corrent_answer_count"
    t.float    "corrent_answer_percent"
    t.float    "need_answer_percent"
    t.boolean  "pass"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "subject_id"
    t.string   "group"
    t.index ["subject_id"], name: "index_statistics_on_subject_id", using: :btree
    t.index ["test_id"], name: "index_statistics_on_test_id", using: :btree
    t.index ["user_id"], name: "index_statistics_on_user_id", using: :btree
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "questions_count",     default: 1
    t.float    "need_answer_percent", default: 0.0
  end

  create_table "test_questions", force: :cascade do |t|
    t.integer  "test_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_test_questions_on_question_id", using: :btree
    t.index ["test_id"], name: "index_test_questions_on_test_id", using: :btree
  end

  create_table "tests", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "subject_id"
    t.integer  "last_question_number", default: -1
    t.boolean  "end_page",             default: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["subject_id"], name: "index_tests_on_subject_id", using: :btree
    t.index ["user_id"], name: "index_tests_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "full_name"
    t.string   "group"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
  end

end
