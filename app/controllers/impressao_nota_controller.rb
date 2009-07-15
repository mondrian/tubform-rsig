class ImpressaoNotaController < ApplicationController
  helper :send_doc
  include SendDocHelper
  layout nil

  def dados_nota
    sql = "select * from fnc_dados_nota_fiscal(#{params[:id]})"
    @nota_fiscal = NotaFiscal.find_by_sql(sql)
    #coloca o valor por extenso
     @nota_fiscal.each { |n| n.nf_valor_por_extenso = n.nf_valor_total_nota.real.por_extenso_em_reais.upcase.ljust(248,' #') }
  end

  def imprime_nota
    sql = "select * from fnc_dados_nota_fiscal(#{params[:id]})"
    @nota_fiscal = NotaFiscal.find_by_sql(sql)
    #coloca o valor por extenso
    @nota_fiscal.each { |n| n.nf_valor_por_extenso = n.nf_valor_total_nota.real.por_extenso_em_reais.upcase.ljust(248,' #') }
      send_doc(
        render_to_string(:template => 'impressao_nota/dados_nota', :layout => false),
        'dados_nota_result/invoice_dados_nota/notas_fiscais/nota_fiscal', 
        'nota_fiscal',
        "Nota Fiscal Nro.: #{@nota_fiscal[0].nf_numero_nota}", 
        'pdf')
  end
end
