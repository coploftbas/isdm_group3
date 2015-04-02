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

ActiveRecord::Schema.define(version: 20150402082620) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "document_versions", force: true do |t|
    t.string   "document_name"
    t.string   "version_document_name"
    t.text     "file_location"
    t.text     "comment"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.integer  "document_id_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.integer  "version"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "document_versions", ["created_by_id"], name: "index_document_versions_on_created_by_id", using: :btree
  add_index "document_versions", ["document_id_id"], name: "index_document_versions_on_document_id_id", using: :btree
  add_index "document_versions", ["project_id"], name: "index_document_versions_on_project_id", using: :btree
  add_index "document_versions", ["updated_by_id"], name: "index_document_versions_on_updated_by_id", using: :btree

  create_table "documents", force: true do |t|
    t.string   "name"
    t.text     "comment"
    t.text     "file_location"
    t.integer  "created_by_id"
    t.integer  "updated_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.text     "templateVersion"
  end

  add_index "documents", ["created_by_id"], name: "index_documents_on_created_by_id", using: :btree
  add_index "documents", ["project_id"], name: "index_documents_on_project_id", using: :btree
  add_index "documents", ["updated_by_id"], name: "index_documents_on_updated_by_id", using: :btree

  create_table "prerequisites", force: true do |t|
    t.integer  "document_id_id"
    t.integer  "prerequisite_id_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "prerequisites", ["document_id_id"], name: "index_prerequisites_on_document_id_id", using: :btree
  add_index "prerequisites", ["prerequisite_id_id"], name: "index_prerequisites_on_prerequisite_id_id", using: :btree

  create_table "project_user_roles", force: true do |t|
    t.integer  "user_id_id"
    t.integer  "role_id_id"
    t.integer  "project_id_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_user_roles", ["project_id_id"], name: "index_project_user_roles_on_project_id_id", using: :btree
  add_index "project_user_roles", ["role_id_id"], name: "index_project_user_roles_on_role_id_id", using: :btree
  add_index "project_user_roles", ["user_id_id"], name: "index_project_user_roles_on_user_id_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "project_name"
    t.integer  "delete_flg"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "created_by_id"
  end

  add_index "projects", ["created_by_id"], name: "index_projects_on_created_by_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "role_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_types", force: true do |t|
    t.string   "designation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "delete_flg"
    t.integer  "user_type_id_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["user_type_id_id"], name: "index_users_on_user_type_id_id", using: :btree

end
