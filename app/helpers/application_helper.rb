module ApplicationHelper
	# Para imprimir Yes ou No na tela com base no valor 0(false) e 1(true) no banco
	# Adicionar <%= publicado(produto.publicado?) %> em SHOW ou INDEX
	# Adicionar :true: 'Yes' :false: 'No' em locales/en.yml
	 def publicado(boolean)
	 	I18n.t((!!boolean).to_s)
	 end

	 def friendly_date(d)
		d.strftime("%d/%m/%y %T")
	end
end
