require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/classes/show.html.erb" do
  include ClassesHelper
  before(:each) do
    assigns[:classe] = @classe = stub_model(Classe,
      :descricao => "value for descricao"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ descricao/)
  end
end

