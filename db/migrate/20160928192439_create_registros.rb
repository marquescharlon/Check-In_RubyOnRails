class CreateRegistros < ActiveRecord::Migration
  def change
    create_table :registros do |t|
      t.string :referencia
      t.text :descricao
      t.text :observacao
      t.boolean :concluido

      t.timestamps null: false
    end
  end
end
