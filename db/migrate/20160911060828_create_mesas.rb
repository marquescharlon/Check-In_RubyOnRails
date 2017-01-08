class CreateMesas < ActiveRecord::Migration
  def change
    create_table :mesas do |t|
      t.integer :cadeiras
      t.string :codigo
      t.text :observacao
      t.boolean :reservada

      t.timestamps null: false
    end
  end
end
