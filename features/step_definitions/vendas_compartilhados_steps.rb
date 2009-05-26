Dado /^que estou no formulário de cadastro de (.*)$/ do |entidade|
  visit "#{entidade.pluralize}/new"
  @entidade_principal = entidade
end

Quando /^defino (.*) com o valor (.*)$/ do |atributo,valor|
#  atributo = atributo.gsub(/\s/, '_')
 atributo = @entidade_principal + "[" + atributo + "]"
 fill_in atributo, :with => valor
end

Quando /^seleciono (.*) com o valor (.*)$/ do |atributo,valor|
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
  response.should have_tag("p", :text=> mensagem)
end

Dado /^que existem (\d+) (.+)$/ do |quantidade, entidade|
  entidade = entidade.gsub(/\s/, '_').singularize
  entidade_simbolo = entidade.to_sym
  klass = eval(entidade.camelize)
  quantidade.to_i.times do |i|
      Factory(entidade_simbolo)
  end
end

Dado /^que existe um\(a\) (.*)$/ do |entidade|
  entidade = entidade.gsub(/\s/, '_').singularize
  entidade_simbolo = entidade.to_sym
  klass = eval(entidade.camelize)
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