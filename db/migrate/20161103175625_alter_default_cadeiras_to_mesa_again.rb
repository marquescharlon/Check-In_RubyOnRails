class AlterDefaultCadeirasToMesaAgain < ActiveRecord::Migration
  def change
  	change_column :mesas, :cadeiras, :integer, default: '1'
  end
end
