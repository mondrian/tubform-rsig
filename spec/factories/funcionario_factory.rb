Factory.define :funcionario do |f|
  f.tipo '1'
  f.nome 'Funcionário de Teste'
  f.endereco 'Endereco de Teste'
  f.complemento 'Complemento de Teste'
  f.cep '63500-000'
  f.association :cidade
  f.uf 'CE'
  f.fone '(88)1111-1111'
  f.sequence(:cpf) { |n| "999999999#{n}" }
  f.sequence(:rg) { |n| "999999999#{n}" }
  f.pai 'Pai de Teste'
  f.mae 'Mae de Teste'
  f.numero_carteira_trabalho '2222222222'
  f.serie_carteira_trabalho 'C'
  f.titulo_eleitor '3333333333'
  f.zona_eleitoral '4'
  f.admissao '2009-01-01'
  f.registro '2009-01-01'
  f.nascimento '2009-01-01'
  f.naturalidade 'Naturalidade de Teste'
  f.estado_civil 'Estado Civil de Teste'
  f.grau_instrucao 'Grau de Instrucao de Teste'
  f.cadastro_pis 'Cadastro de PIS de Teste'
  f.numero_pis '5555555555'
  f.cod_banco_pis '6'
  f.nome_banco_pis 'Banco do Brasil'
  f.cod_agencia_pis '0613'
  f.nome_agencia_pis 'Nome da Agencia de Teste'
  f.endereco_banco_pis 'Endereco do Banco de Teste'
  f.demissao '2009-01-02'
  f.observacao 'Observacao de Teste'
  f.aci 'Autorização de CI de Teste'
  f.sequence(:email) { |n| "email#{n}@exemplo.com.br" }
  f.sequence(:login) { |n| "usuario#{n}" }
  f.password '123456'
  f.password_confirmation '123456'
end

