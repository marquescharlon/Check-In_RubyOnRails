class RemoveMesaIdFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :mesa_id, :integer
  end
end
