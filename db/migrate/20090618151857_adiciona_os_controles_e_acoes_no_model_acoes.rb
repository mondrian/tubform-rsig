class AdicionaOsControlesEAcoesNoModelAcoes < ActiveRecord::Migration
  def self.up
		# controllers e ações restfull
    controllers = ['clientes','contra_partidas','duplicatas','faixa_de_descontos','fornecedores','item_pedido_kits','item_pedidos','itens_nota_fiscal','lancamentos','notas_fiscais','pedidos','produto_kits','produtos']
    acoes = { "index" => "Listar","show" => "Exibir","new" => "Novo(a)","edit" => "Alterar","create" => "Criar", "update" => "Atualizar", "destroy" => "Excluir" }
    controllers.each do |c|
      acoes.each_pair do |chave, valor|
        descricao = valor + ' ' + c.singularize.gsub('_',' ').capitalize
	  		Acao.create(:controller_name=>c,:action_name => chave, :descricao => descricao)
      end
    end

		# ações especificas
		Acao.create(:controller_name=>'clientes',:action_name => 'cidade')
		Acao.create(:controller_name=>'item_pedidos',:action_name => 'detalhe', :descricao => 'Ver Itens de Pedido')
		Acao.create(:controller_name=>'itens_nota_fiscal',:action_name => 'detalhe')
		Acao.create(:controller_name=>'pedidos',:action_name => 'selecionar_cliente')
		Acao.create(:controller_name=>'pedidos',:action_name => 'aprovar', :descricao => 'Aprovar Pedido')
		Acao.create(:controller_name=>'pedidos',:action_name => 'desaprovar')
		Acao.create(:controller_name=>'pedidos',:action_name => 'alterar_data_entrega_pedido')
		Acao.create(:controller_name=>'pedidos',:action_name => 'comissao_acordada')
		Acao.create(:controller_name=>'pedidos',:action_name => 'permitir_desconto_no_pedido')

  end

  def self.down
		Acao.delete_all
  end
end

