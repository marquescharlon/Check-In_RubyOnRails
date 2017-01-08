class Tipo < ActiveRecord::Base
	validates_presence_of :nome
  	validates_uniqueness_of :nome
  	has_many :produtos
end