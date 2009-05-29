# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  require 'brazilian-rails'
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password


  include AuthenticatedSystem
  before_filter :valida_permissao


  private 
  def valida_permissao
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
