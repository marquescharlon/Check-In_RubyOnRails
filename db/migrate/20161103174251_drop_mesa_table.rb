class DropMesaTable < ActiveRecord::Migration
  def change
  	drop_table :mesas
  end
end
