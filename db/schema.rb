# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_08_24_205250) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.string "message_id"
    t.bigint "user_id", null: false
    t.bigint "project_id", null: false
    t.bigint "project_thread_id", null: false
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_messages_on_project_id"
    t.index ["project_thread_id"], name: "index_messages_on_project_thread_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "project_threads", force: :cascade do |t|
    t.string "thread_id"
    t.string "project_thread_id"
    t.bigint "project_id", null: false
    t.bigint "user_id", null: false
    t.string "topic"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_threads_on_project_id"
    t.index ["user_id"], name: "index_project_threads_on_user_id"
  end

  create_table "project_users", force: :cascade do |t|
    t.string "project_user_id"
    t.bigint "project_id", null: false
    t.bigint "user_id", null: false
    t.boolean "read_access"
    t.boolean "write_access"
    t.boolean "update_access"
    t.boolean "delete_access"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_users_on_project_id"
    t.index ["user_id"], name: "index_project_users_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "projectid"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "task_id"
    t.string "title"
    t.bigint "project_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_tasks_on_project_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "userid"
    t.string "fullname"
    t.string "email"
    t.string "password_digest"
    t.boolean "isAdmin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "messages", "project_threads"
  add_foreign_key "messages", "projects"
  add_foreign_key "messages", "users"
  add_foreign_key "project_threads", "projects"
  add_foreign_key "project_threads", "users"
  add_foreign_key "project_users", "projects"
  add_foreign_key "project_users", "users"
  add_foreign_key "projects", "users"
  add_foreign_key "tasks", "projects"
  add_foreign_key "tasks", "users"
end
