class CreateEstabelecimentos < ActiveRecord::Migration
  def change
    create_table :estabelecimentos do |t|
      t.string :CNPJ
      t.integer :InscEstadual
      t.string :RazaoSocial
      t.string :NomeFantasia
      t.string :CEP
      t.string :cIdade
      t.string :UF
      t.string :CodigoMunicipalIbge
      t.string :Logradouro
      t.string :Bairro
      t.integer :Numero
      t.string :Complemento
      t.string :TelefoneFixo
      t.string :Celular
      t.string :Email
      t.text :Observacao

      t.timestamps null: false
    end
  end
end
