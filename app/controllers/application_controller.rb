class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  include AuthenticatedSystem
  #before_filter :valida_permissao

  def load_page
    @page = params[:page] || '1'
    @per_page = (params[:limit] || '30').to_i
    @per_page = 30 if @per_page > 30

    fields = eval(params[:fields]) if params[:fields]
    query = params[:query] if params[:query]

    if fields
      @conditions = []
      fields.each do |field|
        if field.include? '.'
          foo = field.split('.')
          field = foo[0].underscore.pluralize + '.' + foo[1]
        else
          field = self.class.to_s.chomp('Controller') + '.' + field
        end
        @conditions << "#{field} like '#{query}%'"
      end
      @conditions = @conditions.join(' OR ')
    end
    true
  end
=begin
  private
  def valida_permissao
  if self.controller_name == 'sessions' and self.action_name == 'index'
   true
   else 
   begin
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
   end
end
end
=end
end

