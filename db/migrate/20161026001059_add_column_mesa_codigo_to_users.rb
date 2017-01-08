class AddColumnMesaCodigoToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :mesa_codigo, :string
  end
end
