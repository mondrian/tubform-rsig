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

Dado /^que existe\(m\) registro\(s\) de (.+) com os seguintes dados:$/ do |entidade,tabela|
  entidade = entidade.gsub(/\s/, '_')
  entidade_simbolo = entidade.to_sym
  classe = eval(entidade.camelize)
  parametros = {}
  classe.transaction do
    classe.destroy_all
    tabela.hashes.each do |hash|
      parametros = {}
      hash.each_pair do |chave, valor|
        chave = chave.gsub(/\s/, '_')
        if valor == 'sim'
          valor = true
        elsif valor == 'não'
          valor =  false
        else
          parametros[chave] = valor
        end
      end
      Factory(entidade_simbolo, parametros)
    end
  end
end

Dado /^que o (.+) em parâmetros é "([^\"]*)"$/ do |chave, valor|
  Parametro.transaction do
    Parametro.destroy_all
    Factory(:parametro, :chave => chave , :valor => valor)
  end
end

Dado /^que existe um cliente$/ do
  Cliente.destroy_all
  Factory(:cliente, :nome_fantasia => 'Cliente de Teste')
end

Dado /^que existe um usuário$/ do
  Funcionario.destroy_all
  Factory(:funcionario, :login => 'usuario1')
end

Dado /^que existe um pedido$/ do
  Pedido.destroy_all
  Factory(:pedido, :id => 1)
end

Dado /^que existe um item de pedido$/ do
  ItemPedido.destroy_all
  Factory(:item_pedido, :id => 1)
end

Dado /^que existe um produto$/ do
  Produto.destroy_all
  Factory(:produto, :id => 1)
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
  inspecionar_erro do
    click_button(acao.capitalize)
  end
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

Então /^não devo ver "([^\"]*)"$/ do |texto|
  response.should_not contain(texto)
end


Então /^eu preciso ver os seguintes registros:$/ do |tabela|
  tabela.hashes.each do |hash|
    hash.each_value do |valor|
      response.should contain(valor)
    end
  end
end

