class Duplicata < ActiveRecord::Base
  belongs_to :pedido
  has_many   :contra_partidas
 
	after_destroy :log_duplicata_destroy_action  

	def log_duplicata_destroy_action 
		puts 'Duplicata destroyed'
	end 

  def possui_lancamentos?
    self.contra_partidas.size > 0
  end
end
