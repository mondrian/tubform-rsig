require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/parametros/show.html.erb" do
  include ParametrosHelper
  before(:each) do
    assigns[:parametro] = @parametro = stub_model(Parametro,
      :chave => "value for chave",
      :valor => "value for valor",
      :descricao => "value for descricao",
      :empresa_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ chave/)
    response.should have_text(/value\ for\ valor/)
    response.should have_text(/value\ for\ descricao/)
    response.should have_text(/1/)
  end
end

