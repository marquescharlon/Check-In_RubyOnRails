class RemoveImagemProduto < ActiveRecord::Migration
  def change
  	remove_column :produtos, :imagem, :string
  end
end
