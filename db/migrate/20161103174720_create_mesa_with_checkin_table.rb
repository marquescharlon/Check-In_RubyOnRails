class CreateMesaWithCheckinTable < ActiveRecord::Migration
  def change
    create_table :mesas do |t|
      t.integer :cadeiras
      t.string :codigo
      t.boolean :reservada
      t.boolean :checkin
      t.datetime :realizado_at
      t.text :observacao

      t.timestamps null: false
    end
  end
end
