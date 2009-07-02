class PedidosController < ApplicationController
  def selecionar_cliente
    if request.post?
      @cliente = Cliente.find(params[:cliente][:id])
      if @cliente
        redirect_to :action => :new, :id => @cliente.id
      end
    else
      @cliente = Cliente.new
    end
  end

  def index

 	@pedidos = Pedido.find(:all, :include => [:cliente], :offset => params[:start], :limit => params[:limit] )
	puts "*********"
	puts @pedidos[0].cliente.razao_social
	puts "*********"
    @dto = Hash.new
    @dto[:total] = Pedido.count
    @dto[:results] = @pedidos

    #@pedidos = Pedido.all
    @qtd_pedidos = @pedidos.count

    respond_to do |format|
	  format.json { render :layout => false,
                           :json => @dto.to_json }
      format.html # index.html.erb
      format.xml  { render :xml => @pedidos }
    end
  end

  def show
    @pedido = Pedido.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pedido }
    end
  end

  def new
    @pedido = Pedido.new
    @pedido.cliente = Cliente.find(:first)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pedido }
    end
  end

  def edit
    @pedido = Pedido.find(params[:id])
  end

  def create
    @pedido = Pedido.new(params[:pedido])

    @pedido.operador_id = 1 # Deverá vir na session (lembrar de arrumar depois)
    respond_to do |format|
      if @pedido.save
        flash[:notice] = 'Pedido Cadastrado com Sucesso'
        format.html { redirect_to(@pedido) }
        format.xml  { render :xml => @pedido, :status => :created, :location => @pedido }
      else
        render :text => @pedido.errors.full_messages.to_s + @pedido.data.to_s
        return
        flash[:notice] = @pedido.errors
        format.html { render :action => "new" }
        format.xml  { render :xml => @pedido.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @pedido = Pedido.find(params[:id])

    respond_to do |format|
      if @pedido.update_attributes(params[:pedido])
        flash[:notice] = 'Pedido Atualizado com Sucesso'
        format.html { redirect_to(@pedido) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pedido.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @pedido = Pedido.find(params[:id])
    @pedido.destroy

    respond_to do |format|
      format.html { redirect_to(pedidos_url) }
      format.xml  { head :ok }
    end
  end

  def aprovar
    @pedido = Pedido.find(params[:id])
    @pedido.data_aprovacao_pedido = Date.today
    @pedido.autorizador = current_user
    @pedido.status = 'Aprovado'
    respond_to do |format|
      if @pedido.save
        flash[:notice] = 'Pedido Aprovado'
        format.html { redirect_to(@pedido) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pedido.errors,
                             :status => :unprocessable_entity }
      end
    end
  end

  def desaprovar
    @pedido = Pedido.find(params[:id])
    @pedido.data_aprovacao_pedido = nil
    @pedido.autorizador = nil
    @pedido.status = 'Não Aprovado'
    respond_to do |format|
      if @pedido.save
        flash[:notice] = 'Pedido Desaprovado'
        format.html { redirect_to(@pedido) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pedido.errors,
                             :status => :unprocessable_entity }
      end
    end
  end

  def alterar_data_entrega_pedido
    @pedido = Pedido.find(params[:id])
    @pedido.entrega = nil
    respond_to do |format|
      if @pedido.save
        flash[:notice] = 'Data de Entrega Zerada'
        format.html { redirect_to(@pedido) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pedido.errors,
                             :status => :unprocessable_entity }
      end
    end
  end

  def comissao_acordada
    @pedido = Pedido.find(params[:id])
  end

  def permitir_desconto_no_pedido
    @pedido = Pedido.find(params[:id])
  end

  def impressao
    @pedido = Pedido.find(params[:id])

    respond_to do |format|
      format.html # impressao.html.erb
      format.xml  { render :xml => @pedido }
    end
  end
end

