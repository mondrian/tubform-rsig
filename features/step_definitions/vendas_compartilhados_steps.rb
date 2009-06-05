Dado /^que estou no formulário de cadastro de (.*)$/ do |entidade|
  visit "#{entidade.pluralize}/new"
  @entidade_principal = entidade
end

Quando /^defino (.*) com o valor (.*)$/ do |atributo,valor|
  atributo = atributo.gsub(/\s/, '_')
  if ((atributo != "login") and (atributo != "password")) then
    atributo = @entidade_principal + "_" + atributo
  end
  fill_in atributo, :with => valor
end

Dado /^seleciono (.*) com o valor (.*)$/ do |atributo,valor|
#  atributo = atributo.gsub(/\s/, '_')
 atributo = @entidade_principal + "[" + atributo + "]"
 select(valor,atributo)
end

Quando /^eu salvar o registro$/ do
  click_button "Salvar"
end

Quando /^eu clicar em (.*)$/ do |botao|
  click_button botao
end

Então /^preciso receber a mensagem "([^\"]*)"$/ do |mensagem|
  response_body.should have_tag("p", :text=> mensagem)
end

Dado /^que existem (\d+) (.+)$/ do |quantidade, entidade|
  entidade = entidade.gsub(/\s/, '_').singularize
  entidade_simbolo = entidade.to_sym
  klass = eval(entidade.camelize)
  klass.delete_all
  quantidade.to_i.times do |i|
      Factory(entidade_simbolo)
  end
end

Dado /^que existe um\(a\) (.*)$/ do |entidade|
  entidade = entidade.gsub(/\s/, '_').singularize
  entidade_simbolo = entidade.to_sym
  klass = eval(entidade.camelize)
  klass.delete_all
  Factory(entidade_simbolo)
  klass.count > 0
end

Dado /^este (.*) está atribuido a um determinado\(a\) (.*)$/ do |pai, entidade|
  entidade = entidade.gsub(/\s/, '_').singularize
  entidade_simbolo = entidade.to_sym
  klass = eval(entidade.camelize)
  Factory(entidade_simbolo)
end

Dado /^que estou no detalhe de (.*) (\d+)$/ do |entidade, id|
  klass = eval(entidade.camelize)
  @registro = klass.find(:first)
  visit "#{entidade.pluralize}/edit/#{@registro.id}"
end

Dado /^que estou na exibição de (.*) (\d+)$/ do |entidade, id|
  klass = eval(entidade.camelize)
  Factory(entidade.to_sym)
  @registro = klass.find(:first)
  visit "#{entidade.pluralize}/show/#{@registro.id}"
end

Quando /^eu estiver na listagem de (.*)$/ do |entidades|
  visit "#{entidades}"
end

Então /^preciso ver (.*) (.*)$/ do |quantidade,entidades|
  entidade = eval(entidades.singularize.camelize)
  registros = entidade.find(:all)
  registros.count.should == quantidade.to_i
  registros.each {|r| have_tag("td", :content => "#{r.id}")}
end


Dado /^que o usuário (.+) com senha (.+) existe$/ do |login, senha|
  Factory(:funcionario, :login => login, :password => senha, :password_confirmation => senha)
end

Dado /^que o usuário (.+) possui as seguintes permissões:$/ do |login,tabela|
  funcionario = Funcionario.find_by_login(login)
  tabela.hashes.each do |hash|
    acao = Factory(:acao, hash)
    Factory(:acao_funcionario, :acao_id => acao.id, :funcionario_id => funcionario.id)
  end
end

Dado /^que estou em (.*)$/ do |nome_da_pagina|
  visit path_to(nome_da_pagina)
end


Quando /^eu pedir autenticação$/ do
  click_button("Entrar")
end

Dado /^que me identifiquei como (.+) com a senha (.+)$/ do |login, senha|
  Funcionario.destroy_all
  Acao.destroy_all
  AcaoFuncionario.destroy_all
  Dado "que o usuário #{login} com senha #{senha} existe"
  Dado "que o usuário #{login} possui as seguintes permissões:", table(%{
    | controller_name | action_name |
    | pedidos         | new         |
    | pedidos         | desconto    |
  })
  Dado "que estou em autenticação"
  Dado "defino login com o valor #{login}"
  Dado "defino password com o valor #{senha}"
  Quando "eu pedir autenticação"
end

