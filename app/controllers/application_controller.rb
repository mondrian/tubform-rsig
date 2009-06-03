class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  require 'brazilian-rails'
  layout 'application'
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password


  include AuthenticatedSystem
  before_filter :valida_permissao


  private 
  def valida_permissao
		if self.controller_name == 'sessions' and not self.action_name == 'index'
      true
begin
		else

      if logged_in?
        acao = Acao.find(:first, :conditions => ["controller_name = ? and action_name = ?",self.controller_name, self.action_name])
        if current_user.acoes.include? acao
          true
        else
          render :text => "Acesso negado a " + self.controller_name + ' acao ' + self.action_name + '. Você não tem acesso a esta ação.'
        end

      else
        render :text => "Acesso negado a " + self.controller_name + ' acao ' + self.action_name + '. Você não está logado'
      end
end
		end
  end
end
