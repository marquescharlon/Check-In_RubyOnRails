class AlterTypeValorProdutos < ActiveRecord::Migration
  def change
  	change_column :produtos, :valor, :decimal, :precision => 15, :scale => 3
  end
end