@incompleta
Feature: Gerenciar produtos
  Como um estoquista
  Eu quero gerenciar os cadastros de produtos
  Para que os mesmos sejam identificados para venda

  Contexto:
    Dado que existe(m) 3 registro(s) de produto
    E que me identifiquei
    E possuo permissão para "Listar Produto"
    E possuo permissão para "Novo(a) Produto"
    E possuo permissão para "Criar Produto"

  Cenário: Adicionar um produto válido não kit
    E que estou em cadastro de produto
    E defino descrição como "Produto de Teste"
    E seleciono o(a) cor "Cor de Teste"
    E defino valor especial como "5"
    E defino valor normal como "10"
    E seleciono o(a) classe "Classe de Teste"
    E seleciono o(a) grupo "Grupo de Teste"
    E seleciono o(a) grupo "Grupo de Teste"
    E defino ativo como "sim"
    E defino situação tributária como "1"
    E defino preço mínimo nota fiscal como "5"
    E defino ipi como "0.35"
    E defino classificação fiscal como "0200"
    E defino peso liquido como "3000"
    E defino código da emissão na nota fiscal como "12345"
    E defino descrição na nota fiscal como "Descrição de Teste"
    E seleciono o(a) funcionário "Funcionário de Teste"
    E defino emissão em relatório como "sim"
    E defino custo como "3"
    E defino data de cadastro do custo como "2009-06-24"
    Quando peço para salvar
    Então preciso ver "Registro cadastrado com Sucesso"

  Cenário: Alterar um produto válido não kit
    Dado que estou em listagem de produtos
    E peço a alteração do produto que o(a) descricao é "Produto de Teste 1"
    E defino o valor normal como "12"
    E defino o valor especial como "3"
    Quando peço para salvar
    Então preciso ver "Registro atualizado com Sucesso"

  Cenário: Adicionar um produto válido kit
    E que estou em cadastro de produto
    E defino descrição como "Produto de Teste"
    E seleciono o(a) cor "Cor de Teste"
    E defino valor especial como "5"
    E defino valor normal como "10"
    E seleciono o(a) classe "Classe de Teste"
    E seleciono o(a) grupo "Grupo de Teste"
    E seleciono o(a) grupo "Grupo de Teste"
    E defino ativo como "sim"
    E defino situação tributária como "1"
    E defino preço mínimo nota fiscal como "5"
    E defino ipi como "0.35"
    E defino classificação fiscal como "0200"
    E defino peso liquido como "3000"
    E defino código da emissão na nota fiscal como "12345"
    E defino descrição na nota fiscal como "Descrição de Teste"
    E seleciono o(a) funcionário "Funcionário de Teste"
    E defino emissão em relatório como "sim"
    E defino custo como "3"
    E defino data de cadastro do custo como "2009-06-24"
    Quando peço para salvar
    Então preciso ver "Registro cadastrado com Sucesso"

  Cenário: Alterar um produto válido kit
    Dado que estou em listagem de produtos
    E peço a alteração do produto que o(a) descricao é "Produto de Teste 1"
    E defino o valor normal como "12"
    E defino o valor especial como "3"
    Quando peço para salvar
    Então preciso ver "Registro atualizado com Sucesso"

  Cenário: Listar produtos
    Quando eu estiver em listagem de produtos
    Então preciso ver "Encontrado(s) 3 registro(s)."

