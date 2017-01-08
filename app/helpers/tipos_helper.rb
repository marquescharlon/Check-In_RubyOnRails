module TiposHelper
	def friendly_date(d)
		d.strftime("%d/%m/%y %T")
		#d.strftime("%B %e, %Y")
	end
end
