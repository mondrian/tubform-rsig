class Area < ActiveRecord::Base
    belongs_to :cidade
    belongs_to :roteiro

    has_many :pedidos
    validates_presence_of :descricao, :message => "Insira uma Descrição para a Área"
    validates_presence_of :roteiro_id
end

