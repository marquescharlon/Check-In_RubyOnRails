class Mesa < ActiveRecord::Base

	# validates_uniqueness_of :checkin, :reservada

	def self.search(search, page)
		order('id')
		.where(:reservada => false)
		.where('id LIKE ? or codigo LIKE ? or observacao LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
		.paginate(page: page, per_page: 4)
		.order('created_at DESC')
	end
	validates :codigo, :presence => true, 
	exclusion: { in: %w(Mesa MESA mesa mesa1 mesa01 mesa0001),
    message: "%{value} não é permitido por questões de segurança. 
    Sugerimos que escolha um código que não seja fácil para o usuário descobrir. Por exemplo, DIADOSPAIS150.
    Porém, fica a seu critério qual código usar considerando que seja seguro." }, 
    uniqueness: { case_sensitive: false },
    length: { minimum: 8, maximum: 20}
end