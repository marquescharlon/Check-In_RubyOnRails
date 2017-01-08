class AddColumnMesaIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mesa_id, :integer
  end
end
