class MotivoAssistencia < ActiveRecord::Base
   has_many :itens_pedido_de_assistencia
end
