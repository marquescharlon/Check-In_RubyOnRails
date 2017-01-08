class AddColumCpfNomeCepCidadeLogradouroBairroNumeroComplementoTelfixoTelcelular < ActiveRecord::Migration
  def change
  	add_column :users, :num_acompanhante, :integer
  	add_column :users, :cpf, :string
  	add_column :users, :nome, :string
  	add_column :users, :cep, :integer
  	add_column :users, :cidade, :string
  	add_column :users, :logradouro, :string
  	add_column :users, :bairro, :string
  	add_column :users, :numero, :integer
  	add_column :users, :complemento, :string
  	add_column :users, :tel_fixo, :string
  	add_column :users, :tel_celular, :string
  end
end
