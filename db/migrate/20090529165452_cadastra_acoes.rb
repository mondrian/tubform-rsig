class CadastraAcoes < ActiveRecord::Migration
  def self.up
		#produtos
		Acao.create(:controller_name=>'produtos',:action_name => 'new')
		Acao.create(:controller_name=>'produtos',:action_name => 'create')
		Acao.create(:controller_name=>'produtos',:action_name => 'update')
		Acao.create(:controller_name=>'produtos',:action_name => 'edit')
		Acao.create(:controller_name=>'produtos',:action_name => 'destroy')
		Acao.create(:controller_name=>'produtos',:action_name => 'index')
  end

  def self.down
  end
end
