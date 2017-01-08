class AlterDefaultValorProdutos < ActiveRecord::Migration
  def change
  	change_column :produtos, :valor, :decimal, :precision => 15, :scale => 2
  end
end
