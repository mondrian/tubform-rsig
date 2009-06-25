class CadastraAcoes < ActiveRecord::Migration
  def self.up
    #cadastrava as acoes
  end

  def self.down
		Acao.destroy_all
  end
end
