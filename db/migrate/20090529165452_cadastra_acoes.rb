class CadastraAcoes < ActiveRecord::Migration
  def self.up
		#produtos
		Acao.create(:controller_name=>'produtos',:action_name => 'new')
		Acao.create(:controller_name=>'produtos',:action_name => 'create')
		Acao.create(:controller_name=>'produtos',:action_name => 'update')
		Acao.create(:controller_name=>'produtos',:action_name => 'edit')
		Acao.create(:controller_name=>'produtos',:action_name => 'destroy')
		Acao.create(:controller_name=>'produtos',:action_name => 'index')

    #pedidos
		Acao.create(:controller_name=>'pedidos',:action_name => 'new')
		Acao.create(:controller_name=>'pedidos',:action_name => 'create')
		Acao.create(:controller_name=>'pedidos',:action_name => 'update')
		Acao.create(:controller_name=>'pedidos',:action_name => 'edit')
		Acao.create(:controller_name=>'pedidos',:action_name => 'destroy')
		Acao.create(:controller_name=>'pedidos',:action_name => 'index')

    #pedidos
		Acao.create(:controller_name=>'item_pedidos',:action_name => 'new')
		Acao.create(:controller_name=>'item_pedidos',:action_name => 'create')
		Acao.create(:controller_name=>'item_pedidos',:action_name => 'update')
		Acao.create(:controller_name=>'item_pedidos',:action_name => 'edit')
		Acao.create(:controller_name=>'item_pedidos',:action_name => 'destroy')
		Acao.create(:controller_name=>'item_pedidos',:action_name => 'index')


  end

  def self.down
		Acao.destroy_all
  end
end
