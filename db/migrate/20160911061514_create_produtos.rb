class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :imagem
      t.string :nome
      t.text :descricao
      t.references :tipo, index: true, foreign_key: true
      t.decimal :valor
      t.string :cupom
      t.boolean :publicado

      t.timestamps null: false
    end
  end
end
