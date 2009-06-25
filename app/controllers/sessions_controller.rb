# This controller handles the login/logout function of the site.
class SessionsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  before_filter :valida_permissao, :only => :index

  def index
  end

  # render new.rhtml
  def new
  end

  def create
    self.current_user = Funcionario.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == '1'
        current_user.remember_me unless current_user.remember_token?
        cookies[:auth_token] = { :value => self.current_user.remember_token, :expires => self.current_user.remember_token_expires_at }
      end
      flash[:notice] = "#{self.current_user.nome}, seja bem vindo!"
      redirect_back_or_default('/')
    else
      note_failed_signin
      render :action => 'new'
    end
  end

  def destroy
    logout_killing_session!
    flash[:notice] = "Você foi Desconectado."
    redirect_to '/login'
  end

protected
  # Track failed login attempts
  def note_failed_signin
    flash[:error] = "Autenticação inválida, verifique seus dados."
    logger.warn "Falha de Autenticação para '#{params[:login]}' de #{request.remote_ip} em #{Time.now.utc}"
  end
end

