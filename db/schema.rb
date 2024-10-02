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

ActiveRecord::Schema[7.2].define(version: 2024_10_02_110908) do
  create_table "classrooms", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "school_id"
    t.index ["school_id"], name: "index_classrooms_on_school_id"
  end

  create_table "classrooms_subjects", id: false, force: :cascade do |t|
    t.integer "classroom_id", null: false
    t.integer "subject_id", null: false
    t.index ["classroom_id", "subject_id"], name: "index_classrooms_subjects_on_classroom_id_and_subject_id"
    t.index ["subject_id", "classroom_id"], name: "index_classrooms_subjects_on_subject_id_and_classroom_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer "classroom_id"
    t.integer "subject_id"
    t.integer "user_id"
    t.integer "student_group_id"
    t.index ["classroom_id"], name: "index_lessons_on_classroom_id"
    t.index ["student_group_id"], name: "index_lessons_on_student_group_id"
    t.index ["subject_id"], name: "index_lessons_on_subject_id"
    t.index ["user_id"], name: "index_lessons_on_user_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.text "localization"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "school_id"
    t.index ["school_id"], name: "index_student_groups_on_school_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_group_id", null: false
    t.index ["student_group_id"], name: "index_students_on_student_group_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_group_id"
    t.index ["student_group_id"], name: "index_teachers_on_student_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "student"
    t.integer "school_id", default: 1
    t.string "name"
    t.string "surname"
    t.integer "student_group_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["school_id"], name: "index_users_on_school_id"
    t.index ["student_group_id"], name: "index_users_on_student_group_id"
  end

  add_foreign_key "classrooms", "schools"
  add_foreign_key "lessons", "classrooms"
  add_foreign_key "lessons", "student_groups"
  add_foreign_key "lessons", "subjects"
  add_foreign_key "lessons", "users"
  add_foreign_key "student_groups", "schools"
  add_foreign_key "students", "student_groups"
  add_foreign_key "teachers", "student_groups"
  add_foreign_key "users", "schools"
  add_foreign_key "users", "student_groups"
end
