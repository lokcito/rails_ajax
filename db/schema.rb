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

ActiveRecord::Schema[7.0].define(version: 0) do
  create_table "Comuna", primary_key: "codigo_comuna", id: :integer, default: nil, charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre", limit: 30
    t.integer "codigo_region"
    t.index ["codigo_region"], name: "fk_comuna_region"
  end

  create_table "Curso", primary_key: "codigo_curso", id: { type: :string, limit: 30 }, charset: "utf8mb4", force: :cascade do |t|
    t.date "fecha_inicio"
    t.date "fecha_termno"
    t.integer "codigo_comuna"
    t.string "codigo_plan_formativo", limit: 30
    t.index ["codigo_comuna"], name: "fk_curso_comuna"
    t.index ["codigo_plan_formativo"], name: "fk_curso_plan_formativo"
  end

  create_table "Curso_Modulo_Tutor", primary_key: ["codigo_curso", "codigo_modulo", "codigo_tutor"], charset: "utf8mb4", force: :cascade do |t|
    t.string "codigo_curso", limit: 30, null: false
    t.integer "codigo_modulo", null: false
    t.integer "codigo_tutor", null: false
    t.index ["codigo_modulo"], name: "fk_curso_modulo_tutor_modulo"
    t.index ["codigo_tutor"], name: "fk_curso_modulo_tutor_tutor"
  end

  create_table "Estudiante", primary_key: "id_estudiante", id: :integer, default: nil, charset: "utf8mb4", force: :cascade do |t|
    t.string "rut", limit: 15
    t.string "nombre", limit: 30
    t.string "apellido_pat", limit: 30
    t.string "apellido_mat", limit: 30
    t.string "direccion", limit: 100
    t.date "nacimiento", null: false
    t.integer "codigo_comuna"
    t.string "codigo_curso", limit: 30
    t.index ["codigo_comuna"], name: "fk_estudiante_comuna"
    t.index ["codigo_curso"], name: "fk_estudiante_curso"
  end

  create_table "Modulo", primary_key: "codigo_modulo", id: :integer, default: nil, charset: "utf8mb4", force: :cascade do |t|
    t.string "descripcion", limit: 100
    t.integer "duracion_horas"
  end

  create_table "Plan_Formativo", primary_key: "codigo_plan_formativo", id: { type: :string, limit: 30 }, charset: "utf8mb4", force: :cascade do |t|
    t.string "descripcion", limit: 250
    t.integer "duracion_horas"
  end

  create_table "Plan_Modulo", primary_key: ["codigo_plan_formativo", "codigo_modulo"], charset: "utf8mb4", force: :cascade do |t|
    t.string "codigo_plan_formativo", limit: 30, null: false
    t.integer "codigo_modulo", null: false
    t.index ["codigo_modulo"], name: "fk_plan_modulo_modulo"
  end

  create_table "Region", primary_key: "codigo_region", id: :integer, default: nil, charset: "utf8mb4", force: :cascade do |t|
    t.string "nombre", limit: 30
  end

  create_table "Tutor", primary_key: "codigo_tutor", id: :integer, default: nil, charset: "utf8mb4", force: :cascade do |t|
    t.string "rut", limit: 15
    t.string "nombre", limit: 30
    t.string "apellido_pat", limit: 30
    t.string "apellido_mat", limit: 30
    t.string "direccion", limit: 100
    t.string "cargo", limit: 20
    t.integer "codigo_comuna"
    t.index ["codigo_comuna"], name: "fk_tutor_comuna"
  end

  add_foreign_key "Comuna", "region", column: "codigo_region", primary_key: "codigo_region", name: "fk_comuna_region"
  add_foreign_key "Curso", "comuna", column: "codigo_comuna", primary_key: "codigo_comuna", name: "fk_curso_comuna"
  add_foreign_key "Curso", "plan_formativo", column: "codigo_plan_formativo", primary_key: "codigo_plan_formativo", name: "fk_curso_plan_formativo"
  add_foreign_key "Curso_Modulo_Tutor", "curso", column: "codigo_curso", primary_key: "codigo_curso", name: "fk_curso_modulo_tutor_curso"
  add_foreign_key "Curso_Modulo_Tutor", "modulo", column: "codigo_modulo", primary_key: "codigo_modulo", name: "fk_curso_modulo_tutor_modulo"
  add_foreign_key "Curso_Modulo_Tutor", "tutor", column: "codigo_tutor", primary_key: "codigo_tutor", name: "fk_curso_modulo_tutor_tutor"
  add_foreign_key "Estudiante", "comuna", column: "codigo_comuna", primary_key: "codigo_comuna", name: "fk_estudiante_comuna"
  add_foreign_key "Estudiante", "curso", column: "codigo_curso", primary_key: "codigo_curso", name: "fk_estudiante_curso"
  add_foreign_key "Plan_Modulo", "modulo", column: "codigo_modulo", primary_key: "codigo_modulo", name: "fk_plan_modulo_modulo"
  add_foreign_key "Plan_Modulo", "plan_formativo", column: "codigo_plan_formativo", primary_key: "codigo_plan_formativo", name: "fk_plan_modulo_plan_formativo"
  add_foreign_key "Tutor", "comuna", column: "codigo_comuna", primary_key: "codigo_comuna", name: "fk_tutor_comuna"
end
