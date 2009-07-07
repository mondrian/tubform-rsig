class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  include AuthenticatedSystem
  before_filter :valida_permissao

  def load_page
    @page = params[:page] || '1'
    @per_page = (params[:limit] || '30').to_i
    @per_page = 30 if @per_page > 30
    true
  end

  private
  def valida_permissao
 	  if self.controller_name == 'sessions' and self.action_name == 'index'
      true
=begin
    else
      if logged_in?
		     acao = Acao.find(:first, :conditions => ["controller_name = ? and action_name = ?",self.controller_name, self.action_name])
		     if acao.nil? or current_user.acoes.include? acao
		      true
		     else
		      render :text => "Acesso negado a " + self.controller_name + ' acao ' + self.action_name + '. Você não tem acesso a esta ação.'
		     end
      else
        	render :text => "Acesso negado a " + self.controller_name + ' acao ' + self.action_name + '. Você não está logado'
      end
=end
   end
  end
end

