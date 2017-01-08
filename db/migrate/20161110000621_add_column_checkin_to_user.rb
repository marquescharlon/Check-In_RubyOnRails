class AddColumnCheckinToUser < ActiveRecord::Migration
  def change
    add_column :users, :checkin, :boolean
  end
end
