class AlterPrecisionValorProdutos < ActiveRecord::Migration
  def change
  	change_column :produtos, :valor, :decimal, :precision => 5, :scale => 2
  end
end
