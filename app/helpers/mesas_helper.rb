module MesasHelper
	def qrcode_link(x)
		x = ("http://chart.apis.google.com/chart?chs=70x70&cht=qr&chl=" + x + "&choe=ISO-8859-1")
	end
	def qrcode_link100(x)
		x = ("http://chart.apis.google.com/chart?chs=300x300&cht=qr&chl=" + x + "&choe=ISO-8859-1")
	end
end