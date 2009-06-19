Dado /^que existe\(m\) (\d+) registro\(s\) de (.+)$/ do |quantidade, entidade|
  entidade = entidade.gsub(/\s/, '_')
  entidade_simbolo = entidade.to_sym
  classe = eval(entidade.camelize)
  classe.transaction do
    classe.destroy_all
    quantidade.to_i.times do |i|
      Factory(entidade_simbolo)
    end
  end
end

Dado /^que existe um usuário$/ do
  Funcionario.destroy_all
  Factory(:funcionario, :login => 'usuario1')
end

Dado /^que existe um pedido$/ do
  Funcionario.destroy_all
  Factory(:pedido, :id => 10)
end

Dado /^que estou em (.+)$/ do |nome_da_pagina|
  visit path_to(nome_da_pagina)
end

Dado /^defino (.+) como "([^\"]*)"$/ do |atributo,valor|
  fill_in(atributo.capitalize, :with => valor)
end

Dado /^seleciono o\(a\) (.+) "([^\"]*)"$/ do |atributo,valor|
  select(valor,atributo)
end

Dado /^que me identifiquei$/ do
  Dado "que estou em sair do sistema"
  Dado "que existe um usuário"
  Dado "que estou em autenticação de usuário"
  Dado "defino usuário como \"usuario1\""
  Dado "defino senha como \"123456\""
  Dado "peço para autenticar"
  Dado "preciso ver \"Funcionário de Teste, seja bem vindo!\""
end

Dado /^possuo permissão para "([^\"]*)"$/ do |permissao|
  acao = Acao.find_by_descricao(permissao)
  funcionario = Funcionario.find_by_login('usuario1')
  funcionario.acoes << acao
  funcionario.save!
end

Quando /^peço para (.+)$/ do |acao|
  click_button(acao.capitalize)
end

Quando /^eu pedir para (.+)$/ do |acao|
  click_link (acao.capitalize)
end

Quando /^eu estiver em (.+)$/ do |nome_da_pagina|
  visit path_to(nome_da_pagina)
end

Então /^preciso ver "([^\"]*)"$/ do |texto|
  response.should contain(texto)
end

Dado /^que o usuário (.+) possui as seguintes permissões:$/ do |login,tabela|
  funcionario = Funcionario.find_by_login(login)
  #tabela.hashes.each do |hash|
  #  acao = Factory(:acao, hash)
  #  Factory(:acao_funcionario, :acao_id => acao.id, :funcionario_id => funcionario.id)
  #end
  funcionario.popula_acoes
end

Dado /^este (.*) está atribuido a um determinado\(a\) (.*)$/ do |pai, entidade|
  entidade = entidade.gsub(/\s/, '_').singularize
  entidade_simbolo = entidade.to_sym
  klass = eval(entidade.camelize)
  Factory(entidade_simbolo)
end

Dado /^que estou no detalhe de (.*) (\d+)$/ do |entidade, id|
  klass = eval(entidade.camelize)
  @entidade_principal = entidade
  @registro = klass.find(:first)
  visit "#{entidade.pluralize}/edit/#{@registro.id}"
end

Dado /^que estou na exibição de (.*) (\d+)$/ do |entidade, id|
  klass = eval(entidade.camelize)
  Factory(entidade.to_sym)
  @registro = klass.find(:first)
  visit "#{entidade.pluralize}/show/#{@registro.id}"
end

Dado /^que estou no formulário de cadastro de (.*)$/ do |entidade|
	Dado "que me identifiquei como tubform com a senha 123456"
  visit "#{entidade.pluralize}/new"
  @entidade_principal = entidade
end

Dado /^seleciono (.*) com o valor (.*)$/ do |atributo,valor|
#  atributo = atributo.gsub(/\s/, '_')
 atributo = @entidade_principal + "[" + atributo + "]"
end

Quando /^eu salvar o registro$/ do
  click_button "Salvar"
end

Quando /^atualizar o registro$/ do
  click_button "Atualizar"
end


Quando /^eu clicar em (.*)$/ do |botao|
  click_button botao
end

