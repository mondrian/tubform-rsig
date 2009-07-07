# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090706131504) do

  create_table "acoes", :force => true do |t|
    t.string   "controller_name"
    t.string   "action_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "descricao"
  end

  create_table "acoes_funcionarios", :force => true do |t|
    t.integer  "acao_id"
    t.integer  "funcionario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "areas", :force => true do |t|
    t.string   "descricao"
    t.integer  "cidade_id"
    t.integer  "roteiro_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cidades", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uf",         :limit => 2
  end

  create_table "classes", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clientes", :force => true do |t|
    t.string   "tipo_cliente",               :limit => 1
    t.string   "razao_social"
    t.string   "nome_fantasia"
    t.string   "documento"
    t.string   "endereco"
    t.string   "complemento"
    t.integer  "cidade_id"
    t.string   "cep"
    t.string   "referencia"
    t.string   "fone_pessoal"
    t.string   "fone_comercial"
    t.string   "fone_celular"
    t.string   "endereco_entrega"
    t.integer  "regiao_entrega_id"
    t.text     "referencias_bancaria"
    t.text     "referencias_comerciais"
    t.text     "observacao"
    t.text     "info_serasa"
    t.date     "data_nascimento"
    t.string   "nome_comprador"
    t.boolean  "vendas_suspensas"
    t.text     "observacao_suspensao_venda"
    t.decimal  "limite_credito",                           :precision => 12, :scale => 2
    t.decimal  "saldo_devedor",                            :precision => 12, :scale => 2
    t.string   "status"
    t.integer  "prazo_medio_maximo"
    t.date     "data_inclusao_prazo_medio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uf"
    t.string   "email"
    t.string   "bairro"
    t.string   "cpf",                        :limit => 11
    t.string   "cnpj",                       :limit => 14
    t.integer  "cidade_entrega_id"
    t.integer  "area_id"
    t.string   "inscricao_estadual"
  end

  create_table "contra_partidas", :force => true do |t|
    t.integer  "lancamento_id"
    t.integer  "plano_de_conta_id"
    t.integer  "duplicata_id"
    t.decimal  "valor_lancamento",               :precision => 12, :scale => 2
    t.string   "tipo_operacao",     :limit => 1
    t.text     "historico"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cores", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "duplicatas", :force => true do |t|
    t.integer  "plano_de_conta_id",                                              :null => false
    t.string   "tipo_cobranca",     :limit => 1,                                 :null => false
    t.date     "data_emissao",                                                   :null => false
    t.date     "data_vencimento",                                                :null => false
    t.decimal  "valor",                           :precision => 12, :scale => 2
    t.integer  "cliente_id",                                                     :null => false
    t.integer  "pedido_id",                                                      :null => false
    t.string   "nome_devedor",      :limit => 50,                                :null => false
    t.integer  "devedor_id",                                                     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expedicoes", :force => true do |t|
    t.integer  "minuta_id"
    t.integer  "produto_id"
    t.string   "numero_do_volume"
    t.decimal  "qtd_carregada"
    t.decimal  "qtd_minuta"
    t.boolean  "vidro"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "faixas_de_desconto", :force => true do |t|
    t.integer  "de"
    t.integer  "ate"
    t.decimal  "desconto_permitido"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fornecedores", :force => true do |t|
    t.string   "nome",       :null => false
    t.string   "endereco",   :null => false
    t.string   "cnpj",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "funcionarios", :force => true do |t|
    t.string   "tipo",                      :limit => 1
    t.string   "nome"
    t.string   "endereco"
    t.string   "complemento"
    t.string   "cep"
    t.integer  "cidade_id"
    t.string   "uf"
    t.string   "fone"
    t.string   "cpf"
    t.string   "rg"
    t.string   "pai"
    t.string   "mae"
    t.string   "numero_carteira_trabalho"
    t.string   "serie_carteira_trabalho"
    t.string   "titulo_eleitor"
    t.string   "zona_eleitoral"
    t.date     "admissao"
    t.date     "registro"
    t.date     "nascimento"
    t.string   "naturalidade"
    t.string   "estado_civil"
    t.string   "grau_instrucao"
    t.date     "cadastro_pis"
    t.string   "numero_pis"
    t.string   "cod_banco_pis"
    t.string   "nome_banco_pis"
    t.string   "cod_agencia_pis"
    t.string   "nome_agencia_pis"
    t.string   "endereco_banco_pis"
    t.date     "demissao"
    t.text     "observacao"
    t.text     "aci"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login",                     :limit => 40
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "funcionarios", ["login"], :name => "index_funcionarios_on_login", :unique => true

  create_table "grupos", :force => true do |t|
    t.string   "descricao"
    t.decimal  "margem_lucro"
    t.boolean  "unificado"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_pedido_kits", :force => true do |t|
    t.integer  "pedido_id"
    t.decimal  "quantidade"
    t.decimal  "valor_tabela"
    t.decimal  "valor_venda"
    t.decimal  "desconto"
    t.integer  "produto_id"
    t.integer  "produto_kit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_pedidos", :force => true do |t|
    t.decimal  "quantidade"
    t.decimal  "valor_tabela"
    t.decimal  "valor_venda"
    t.decimal  "desconto",          :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "produto_id"
    t.integer  "pedido_id"
    t.boolean  "emissao_relatorio"
  end

  add_index "item_pedidos", ["pedido_id"], :name => "index_item_pedidos_on_pedido_id"

  create_table "itens_minutas", :force => true do |t|
    t.integer  "produto_id"
    t.integer  "qtde"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "minuta_id"
  end

  create_table "itens_nota_fiscal", :force => true do |t|
    t.integer  "produto_id"
    t.string   "unidade"
    t.integer  "quantidade"
    t.decimal  "valor_item",                       :precision => 12, :scale => 2
    t.decimal  "valor_original",                   :precision => 12, :scale => 2
    t.string   "situacao_tributaria", :limit => 1,                                :default => "T"
    t.decimal  "perc_icms",                        :precision => 6,  :scale => 2
    t.decimal  "perc_ipi",                         :precision => 6,  :scale => 2
    t.decimal  "peso_liquido",                     :precision => 6,  :scale => 2
    t.string   "codigo_emissao",      :limit => 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "nota_fiscal_id"
  end

  create_table "lancamentos", :force => true do |t|
    t.string   "tipo_operacao",       :limit => 1
    t.integer  "plano_de_conta_id"
    t.text     "historico"
    t.date     "data_movimento"
    t.date     "data_lancamento"
    t.string   "doc_origem",          :limit => 1
    t.decimal  "valor",                            :precision => 12, :scale => 2
    t.string   "nome_cheque"
    t.integer  "operador_id"
    t.string   "serie_doc_origem"
    t.integer  "banco_id"
    t.integer  "cliente_id"
    t.boolean  "imprimiu_op"
    t.integer  "vendedor_id"
    t.integer  "sequencia_movimento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meta_produtos", :force => true do |t|
    t.integer  "mes"
    t.integer  "ano"
    t.integer  "qdt_dias_uteis"
    t.date     "data_ini"
    t.date     "data_fim"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "minutas", :force => true do |t|
    t.date     "data"
    t.date     "fechamento"
    t.integer  "operador_fechamento_id"
    t.date     "saida"
    t.text     "obs"
    t.integer  "veiculo_id"
    t.date     "fechamento_financeiro"
    t.integer  "funcionario_fechamento_financeiro_id"
    t.integer  "roteiro_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notas_fiscais", :force => true do |t|
    t.integer  "numero_nota"
    t.integer  "pedido_id"
    t.string   "selo"
    t.string   "serie"
    t.integer  "cliente_id"
    t.decimal  "percentual_icms",                           :precision => 6,  :scale => 2
    t.date     "emissao"
    t.decimal  "total_mercadoria",                          :precision => 12, :scale => 2
    t.decimal  "valor_frete",                               :precision => 12, :scale => 2
    t.string   "cfop"
    t.string   "natureza_operacao"
    t.decimal  "valor_ipi",                                 :precision => 12, :scale => 2
    t.decimal  "valor_desconto",                            :precision => 12, :scale => 2
    t.decimal  "total_nota",                                :precision => 12, :scale => 2
    t.string   "status"
    t.decimal  "base_calculo_icms",                         :precision => 12, :scale => 2
    t.decimal  "valor_icms",                                :precision => 12, :scale => 2
    t.integer  "qtde_volumes"
    t.date     "entrada"
    t.date     "saida"
    t.integer  "transportadora_id"
    t.decimal  "percentual_desconto",                       :precision => 6,  :scale => 2
    t.text     "observacao"
    t.decimal  "base_calculo_icms_substituicao_tributaria", :precision => 12, :scale => 2
    t.decimal  "percentual_icms_substituicao_tributaria",   :precision => 6,  :scale => 2
    t.decimal  "valor_icms_substituicao_tributaria",        :precision => 12, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "operador_id"
    t.integer  "fornecedor_id"
  end

  create_table "parametros", :force => true do |t|
    t.string   "chave"
    t.string   "valor"
    t.string   "descricao"
    t.integer  "empresa_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pedidos", :force => true do |t|
    t.date     "data"
    t.date     "previsao_entrega"
    t.date     "entrega"
    t.date     "programacao"
    t.integer  "cliente_id"
    t.decimal  "valor",                                :precision => 8,  :scale => 2, :default => 0.0
    t.decimal  "acrescimo",                                                           :default => 0.0
    t.decimal  "desconto",                                                            :default => 0.0
    t.integer  "transportadora_id"
    t.string   "nome_comprador"
    t.text     "observacao"
    t.integer  "vendedor_id"
    t.integer  "operador_id"
    t.integer  "telemarketing_id"
    t.string   "endereco_entrega"
    t.integer  "minuta_id"
    t.integer  "area_id"
    t.string   "status"
    t.integer  "funcionario_estorno_id"
    t.boolean  "venda_externa"
    t.decimal  "desconto_complementar",                :precision => 3,  :scale => 2, :default => 0.0
    t.integer  "autorizador_desconto_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "especial"
    t.date     "registro"
    t.integer  "empresa_id"
    t.integer  "operador_estorno_id"
    t.integer  "autorizador_id"
    t.string   "plano_de_pagamento"
    t.string   "tipo",                    :limit => 1
    t.decimal  "percentual_comissao",                  :precision => 6,  :scale => 2, :default => 0.0
    t.date     "data_aprovacao_pedido"
    t.decimal  "comissao_vendedor",                    :precision => 6,  :scale => 2, :default => 0.0
    t.decimal  "comissao_telemarketing",               :precision => 6,  :scale => 2, :default => 0.0
    t.decimal  "valor_normal",                         :precision => 12, :scale => 2, :default => 0.0
    t.boolean  "gera_minuta",                                                         :default => true
    t.date     "data_estorno"
    t.string   "identificador_venda",     :limit => 1
    t.decimal  "total_desconto_item",                  :precision => 12, :scale => 2, :default => 0.0
    t.string   "nosso_numero",            :limit => 7
    t.boolean  "status_estorno",                                                      :default => false, :null => false
  end

  create_table "planosdepagamento", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "produto_kits", :force => true do |t|
    t.integer  "produto_id"
    t.integer  "empresa_id"
    t.decimal  "fator_conversao"
    t.boolean  "status"
    t.decimal  "preco_normal"
    t.decimal  "preco_especial"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_id"
  end

  create_table "produtos", :force => true do |t|
    t.string   "descricao"
    t.integer  "cor_id"
    t.decimal  "valor_especial"
    t.decimal  "valor_normal"
    t.integer  "classe_id"
    t.integer  "grupo_id"
    t.boolean  "status"
    t.integer  "situacao_tributaria"
    t.decimal  "preco_minimo_nota_fiscal"
    t.decimal  "ipi"
    t.integer  "peso_liquido"
    t.integer  "cod_emissao_nota_fiscal"
    t.string   "descricao_nota_fiscal"
    t.decimal  "preco_normal_zona1"
    t.decimal  "preco_especial_zona1"
    t.integer  "funcionario_id"
    t.boolean  "emissao_relatorio"
    t.decimal  "custo"
    t.date     "cadastro_custo"
    t.boolean  "kit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "classificacao_fiscal"
  end

  create_table "regioes", :force => true do |t|
    t.string   "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roteiros", :force => true do |t|
    t.string   "descricao"
    t.integer  "funcionario_id"
    t.integer  "regiao_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transportadoras", :force => true do |t|
    t.string   "razao_social"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uf"
    t.string   "cnpj"
    t.integer  "cidade_id"
    t.string   "inscricao_estadual"
  end

  create_table "ufs", :force => true do |t|
    t.string   "uf",         :limit => 2
    t.string   "descricao",  :limit => 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
