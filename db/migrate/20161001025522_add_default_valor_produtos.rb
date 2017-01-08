class AddDefaultValorProdutos < ActiveRecord::Migration
  def change
  	change_column :produtos, :valor, :decimal, :precision => 15, :scale => 3, default: '0.00'
  end
end
