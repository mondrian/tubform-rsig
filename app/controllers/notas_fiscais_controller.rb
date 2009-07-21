class NotasFiscaisController < ApplicationController
	# bem no metadata_for vai os campos que são symbol do @coisas dentro da interação do for, para serem renderizados e retornados ao cliente, por exemplo id, valor, vendedor e cliente_nome.
  controller_crud_methods_for NotaFiscal, :metadata_for => ['numero_nota', 'selo', 'serie', 'nome_cliente', 'percentual_icms', 'valor_icms', 'status']

def index
    @notas_fiscais = NotaFiscal.find(:all, :conditions => @conditions, :joins => :cliente).paginate( :page => @page,
                                                                  :per_page => @per_page )
    @coisas = []
		#pedidos retorna um array de hash, então, faz-se um laço em pedido pegando apenas os campos que quer retorna para o lado client-side, para não ficar pesado demais.
    for p in @notas_fiscais
			@coisas << {:id => p.id, :numero_nota => p.numero_nota, :selo => p.selo, :serie => p.serie, :nome_cliente => p.cliente.razao_social, :percentual_icms => p.percentual_icms, :valor_icms => p.valor_icms, :status => p.status }
    end

    render_from_hash(@coisas)

  end

=begin
  <td align="center"><%=h n.numero_nota %></td>
  <td align="center"><%=h n.selo %></td>
  <td align="center"><%=h n.serie %></td>
  <td align="left"><%=h n.cliente.razao_social %></td>
  <td align="right"><%=h n.total_nota.real.real_formatado %></td>
  <td align="right"><%=h n.percentual_icms.to_s + ' %' %></td>
  <td align="right"><%=h n.valor_icms.real.real_formatado %></td>
  <td align="center"><%=h n.status == 'S' ? 'Sim' : 'Não' %></td>

  # GET /notas_fiscais
  # GET /notas_fiscais.xml

  layout 'temp'
  def index
    @notas_fiscais = NotaFiscal.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @notas_fiscais }
    end
  end

  # GET /notas_fiscais/1
  # GET /notas_fiscais/1.xml
  def show
    @nota_fiscal = NotaFiscal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @nota_fiscal }
    end
  end

  # GET /notas_fiscais/new
  # GET /notas_fiscais/new.xml
  def new
    @nota_fiscal = NotaFiscal.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @nota_fiscal }
    end
  end

  # GET /notas_fiscais/1/edit
  def edit
    @nota_fiscal = NotaFiscal.find(params[:id])
  end

  # POST /notas_fiscais
  # POST /notas_fiscais.xml
  def create
    @nota_fiscal = NotaFiscal.new(params[:nota_fiscal])

    respond_to do |format|
      if @nota_fiscal.save
        flash[:notice] = 'Nota Fiscal Gravada, Insira os Itens ...'
        format.html { redirect_to(@nota_fiscal) }
        format.xml  { render :xml => @nota_fiscal, :status => :created, :location => @nota_fiscal }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @nota_fiscal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /notas_fiscais/1
  # PUT /notas_fiscais/1.xml
  def update
    @nota_fiscal = NotaFiscal.find(params[:id])

    respond_to do |format|
      if @nota_fiscal.update_attributes(params[:nota_fiscal])
        flash[:notice] = 'Nota Fiscal Atualizada ....'
        format.html { redirect_to(@nota_fiscal) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @nota_fiscal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /notas_fiscais/1
  # DELETE /notas_fiscais/1.xml
  def destroy
    @nota_fiscal = NotaFiscal.find(params[:id])
    @nota_fiscal.destroy

    respond_to do |format|
      format.html { redirect_to(notas_fiscais_url) }
      format.xml  { head :ok }
    end
  end

	def nota_fiscal_populada_via_pedido
		idsdopedido = params[:id]
		@nota_fiscal = NotaFiscal.new
    if idsdopedido.split(',').size > 1
      @nota_fiscal.importa_pedidos!(idsdopedido)
    else
    	@nota_fiscal.importa_pedido!(idsdopedido)
    end
		redirect_to(:action => "index")
	end
=end
end
