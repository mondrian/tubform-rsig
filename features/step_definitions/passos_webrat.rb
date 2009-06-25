require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Quando /^peço a (alteração|exclusão) do (.+) que o\(a\) (.+) é "([^\"]*)"$/ do |acao, classe, variavel, valor|
  classe = classe.gsub(/\s/, '_')
  unless variavel == "id" then
    id = eval("#{classe.camelize}.find_by_#{variavel}('#{valor}').id.to_s")
  else
    id = valor
  end

  within("tr[id=linha_#{classe}_#{id}]") do
    case acao
      when "alteração"
        click_link("Alterar")
      when  "exclusão"
        click_link("Excluir")
    end
  end
end

