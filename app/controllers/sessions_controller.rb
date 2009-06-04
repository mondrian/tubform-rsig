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
    logout_keeping_session!
    user = Funcionario.authenticate(params[:login], params[:password])
    if user
      # Protects against session fixation attacks, causes request forgery
      # protection if user resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset_session
      self.current_user = user
      new_cookie_flag = (params[:remember_me] == "1")
      handle_remember_cookie! new_cookie_flag
      redirect_back_or_default('/')
      flash[:notice] = "Autenticação Bem Sucedida"
    else
      note_failed_signin
      @login       = params[:login]
      @remember_me = params[:remember_me]
      render :action => 'new'
    end
  end

  def destroy
    logout_killing_session!
    flash[:notice] = "Você foi Desconectado."
    redirect_back_or_default('/')
  end

protected
  # Track failed login attempts
  def note_failed_signin
    flash[:error] = "Não foi possível autenticar o Operador '#{params[:login]}'"
    logger.warn "Falha de Autenticação para '#{params[:login]}' de #{request.remote_ip} em #{Time.now.utc}"
  end
end
