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

ActiveRecord::Schema.define(version: 20161110000621) do

  create_table "estabelecimentos", force: :cascade do |t|
    t.string   "CNPJ",                limit: 255
    t.integer  "InscEstadual",        limit: 4
    t.string   "RazaoSocial",         limit: 255
    t.string   "NomeFantasia",        limit: 255
    t.string   "CEP",                 limit: 255
    t.string   "cIdade",              limit: 255
    t.string   "UF",                  limit: 255
    t.string   "CodigoMunicipalIbge", limit: 255
    t.string   "Logradouro",          limit: 255
    t.string   "Bairro",              limit: 255
    t.integer  "Numero",              limit: 4
    t.string   "Complemento",         limit: 255
    t.string   "TelefoneFixo",        limit: 255
    t.string   "Celular",             limit: 255
    t.string   "Email",               limit: 255
    t.text     "Observacao",          limit: 65535
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "mesas", force: :cascade do |t|
    t.integer  "cadeiras",     limit: 4,     default: 1
    t.string   "codigo",       limit: 255
    t.boolean  "reservada"
    t.boolean  "checkin"
    t.datetime "realizado_at"
    t.text     "observacao",   limit: 65535
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "produtos", force: :cascade do |t|
    t.string   "nome",                limit: 255
    t.text     "descricao",           limit: 65535
    t.integer  "tipo_id",             limit: 4
    t.decimal  "valor",                             precision: 5, scale: 2, default: 0.0
    t.string   "cupom",               limit: 255
    t.boolean  "publicado"
    t.datetime "created_at",                                                              null: false
    t.datetime "updated_at",                                                              null: false
    t.string   "imagem_file_name",    limit: 255
    t.string   "imagem_content_type", limit: 255
    t.integer  "imagem_file_size",    limit: 4
    t.datetime "imagem_updated_at"
  end

  add_index "produtos", ["tipo_id"], name: "index_produtos_on_tipo_id", using: :btree

  create_table "registros", force: :cascade do |t|
    t.string   "referencia", limit: 255
    t.text     "descricao",  limit: 65535
    t.text     "observacao", limit: 65535
    t.boolean  "concluido"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "tipos", force: :cascade do |t|
    t.text     "nome",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "mesa_codigo",            limit: 255
    t.integer  "MesaId",                 limit: 4
    t.integer  "num_acompanhante",       limit: 4
    t.string   "cpf",                    limit: 255
    t.string   "nome",                   limit: 255
    t.integer  "cep",                    limit: 4
    t.string   "cidade",                 limit: 255
    t.string   "logradouro",             limit: 255
    t.string   "bairro",                 limit: 255
    t.integer  "numero",                 limit: 4
    t.string   "complemento",            limit: 255
    t.string   "tel_fixo",               limit: 255
    t.string   "tel_celular",            limit: 255
    t.boolean  "checkin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "produtos", "tipos"
end
