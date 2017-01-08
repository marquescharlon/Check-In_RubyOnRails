class AddColumnMesaIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :MesaId, :integer
  end
end
