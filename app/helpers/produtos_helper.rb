module ProdutosHelper
	def friendly_date(d)
		d.strftime("%d/%m/%y %T")
		#d.strftime("%B %e, %Y")
	end

	protected

    #def editando
    #  "editando"
    #end

    # Determinar formatação do impressão no index (R$ 00,00)
    def valor_decimal(x)
    	x = number_to_currency(x, unit: "R$", separator: ",", delimiter: "")
    end

end