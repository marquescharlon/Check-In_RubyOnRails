json.extract! produto, :id, :imagem, :nome, :descricao, :tipo_id, :valor, :cupom, :publicado, :created_at, :updated_at
json.url produto_url(produto, format: :json)