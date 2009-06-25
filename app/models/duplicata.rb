class Duplicata < ActiveRecord::Base
  belongs_to :pedido
  has_many   :contra_partidas

  def possui_lancamentos?
    self.contra_partidas.size > 0
  end

  # metodos para replicacao nos dbfs
  def dbf_delete
    sql = "select excluir_duplicata_receber_dbf(#{self.id}) as resultado"
    x = Duplicata.replicando_no_banco(sql)
  end

  def self.retorna_sql(s)
    sanitize_sql(s)
  end

  def dbf_insert
     # montar nesse ponto as variaveis para a funcao a funcao de insert no dbf recebe como parametros todos os campos da tabela
     # na mesma ordem do dbf  o mais importante e tratar os dados para o formato que o dbf va suportar
     # podemos ver essa parte juntos, coloquem os valores corretos e a gente testa ai
     self.tipo == 'I' ? vtipo = 1 : vtipo = 2
     sql = Duplicata.retorna_sql(["select inserir_duplicata_receber_dbf(?, ?, ?, ?, ?, ?, ?, ?, ?, ?) as resultado",
                                 self.id.to_s,
                                 self.plano_de_conta_id.to_s,
                                 self.tipo_cobranca.to_s,
                                 self.created_at.to_date,
                                 self.data_emissao,
                                 self.data_vencimento,
                                 self.valor,
                                 self.cliente_id.to_s,
                                 self.pedido_id.to_s,
                                 self.nome_devedor])

     x = Duplicata.replicando_no_banco(sql)

  end

	def self.replicando_no_banco(s)
		 x = Pedido.find_by_sql("select replica_dbf(#{(s)}) as resultado")
         x = x[0].resultado
	end

end

