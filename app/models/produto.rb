class Produto < ActiveRecord::Base
  belongs_to :tipo

  validates :nome, :valor, :presence => true

  has_attached_file :imagem, styles:{ original: "800x800>", medium: "670x420#", thumb: "100x100#" },
  :path => ':rails_root/public/images/qro/:id-:basename-:style.:extension',
  :url => '/images/qro/:id-:basename-:style.:extension'


  validates_attachment :imagem,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png", "image/ico"], 
    :message => "Formato errado, aceita arquivos (jpg, jpeg, gif e png)" },
    :size => { :in => 0..4100.kilobytes, :message => "Arquivo muito grande. Máximo 4 MB" }

  # Presença obrigatória
  validates_attachment :imagem, :presence => true

  # Dimensões de imagens
  #validate :file_dimensions, :unless => 'errors.any?'

  def file_dimensions
    if imagem.size
      dimensions = Paperclip::Geometry.from_file(imagem.queued_for_write[:original].path)
      if dimensions.width < 670 || dimensions.height < 420
        errors.add(:image,'deve ter no minimo 670px de largura por 420px de altura')
      end
    end
  end

  def self.search(search, page)
    order('updated_at DESC')
    .where(:publicado => true)
    .where('id LIKE ? or nome LIKE ? or descricao LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    .paginate(page: page, per_page: 6)
  end
end
