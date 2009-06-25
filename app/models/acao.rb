class Acao < ActiveRecord::Base
	# relacionamentos
	has_and_belongs_to_many :funcionarios
end
