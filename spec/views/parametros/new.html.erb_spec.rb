require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/parametros/new.html.erb" do
  include ParametrosHelper
  
  before(:each) do
    assigns[:parametro] = stub_model(Parametro,
      :new_record? => true,
      :chave => "value for chave",
      :valor => "value for valor",
      :descricao => "value for descricao",
      :empresa_id => 1
    )
  end

  it "renders new parametro form" do
    render
    
    response.should have_tag("form[action=?][method=post]", parametros_path) do
      with_tag("input#parametro_chave[name=?]", "parametro[chave]")
      with_tag("input#parametro_valor[name=?]", "parametro[valor]")
      with_tag("input#parametro_descricao[name=?]", "parametro[descricao]")
      with_tag("input#parametro_empresa_id[name=?]", "parametro[empresa_id]")
    end
  end
end


