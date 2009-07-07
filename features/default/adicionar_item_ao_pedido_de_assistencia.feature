# http://www.pivotaltracker.com/story/show/790964
@trabalhando
Feature: Adicionar Item ao Pedido de Assitencia
  Como um vendedor
  Eu quero incluir um item no pedido de assistencia
  Para que eu possa definir os produtos a serem vendidos

  Contexto:
    Dado que me identifiquei
    E possuo permissão para "Listar Pedido"
    E possuo permissão para "Alterar Pedido"
    E possuo permissão para "Atualizar Pedido"
    E possuo permissão para "Ver Itens de Pedido"

  Cenário: Adicionando um componenente de um produto
    E que estou adicionando item a um pedido de assistencia
    E seleciono o(a) produto "Produto de Teste"
    E defino quantidade do produto como "1"
    E defino que quero selecionar componentes
    E seleciono o(a) componente "Componente de Teste"
    E defino quantidade do componente como "1"
    E defino motivo da assistencia do componente como "001"
    E defino justificativa da assistencia do componente como "teste de assistencia"
    Quando peço para salvar
    Então preciso ver "Item adicionado com sucesso ao pedido."
    
  Cenário: Adicionando um produto/kit
    E que estou adicionando item a um pedido de assistencia
    E seleciono o(a) produto "Produto de Teste"
    E defino quantidade do produto como "1"
    E defino que não quero selecionar componentes
    E defino motivo da assistencia do produto como "001"
    E defino justificativa da assistencia do produto como "teste de assistencia"
    Quando peço para salvar
    Então preciso ver "Item adicionado com sucesso ao pedido."
    
