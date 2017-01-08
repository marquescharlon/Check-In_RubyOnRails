json.extract! registro, :id, :referencia, :descricao, :observacao, :concluido, :created_at, :updated_at
json.url registro_url(registro, format: :json)