class ImpressaoNotaController < ApplicationController
  helper :send_doc
  include SendDocHelper

  def dados_nota
    sql = "select * from fnc_dados_nota_fiscal(#{params[:id]})"
    @nota_fiscal = NotaFiscal.find_by_sql(sql)
  end
end
