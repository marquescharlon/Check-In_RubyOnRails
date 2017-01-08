class AddColumnCheckinRealizadoToMesa < ActiveRecord::Migration
  def change
    add_column :mesas, :checkin, :boolean
    add_column :mesas, :realizado_at, :datetime
  end
end
