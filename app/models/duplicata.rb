class Duplicata < ActiveRecord::Base
  belongs_to :pedido
  has_many   :contra_partidas
 
  def possui_lancamentos?
    self.contra_partidas.size > 0
  end
=begin
  sql = Pedido.retorna_sql(["select inserir_duplicata_dbf(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
                             as resultado", self.id, self.banco.id, self.agencia.id, contador, self.plano_de_conta_id, ])
  x = Pedido.find_by_sql(sql)
  x = x[0].resultado

 end

  t.integer  "plano_de_conta_id"
  t.string   "tipo_cobranca"
  t.date     "data_emissao"
  t.date     "data_vencimento"
  t.decimal  "valor"
  t.integer  "cliente_id"
  t.integer  "pedido_id"
  t.string   "nome_devedor"
  t.integer  "devedor_id"
  t.datetime "created_at"
  t.datetime "updated_at"

  1  COD_DUPLIC  Character      6  *
  2  COD_BANCO   Character      3
  3  COD_AGENCI  Character      4
  4  CONTADOR    Character      1
  5  COD_PLACON  Character      5  *
  6  NUM_DUPLIC  Character     15
  7  TIP_COBRAN  Character      1  *
  8  DAT_REGDPL  Date           8  *
  9  DAT_EMIDPL  Date           8  *
 10  DAT_VENDPL  Date           8  *
 11  VAL_DUPLIC  Numeric       15  *
 12  COD_CLIENT  Character      5  *
 13  NUM_PEDIDO  Character      8  *
 14  NUM_LANCAM  Character      6
 15  COD_DEVEDO  Character      5
 16  NOM_DEVEDO  Character     40  *
 17  STR_NOMINA  Character     35
 18  NUM_DOCORI  Character      6
 19  SER_DOCORI  Character      6
 20  IMP_DUPLIC  Logical        1
 21  COD_VENDED  Character      5
 22  A           Character      1            Asc   Machine
 23  HIS_DUPLIC  Character     30


=end

end