require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Quando /^peço a (alteração|exclusão) do (.+) que o\(a\) (.+) é "([^\"]*)"$/ do |acao, classe, variavel, valor|
  classe = classe.gsub(/\s/, '_')
  unless variavel == "id" then
    id = eval("#{classe.camelize}.find_by_#{variavel}('#{valor}').id.to_s")
  else
    id = valor
  end

  case acao
    when 'alteração'
      selenium.click("//a[@href='/#{classe.pluralize}/#{id}/edit']")
    when 'exclusão'
      selenium.click("//a[@href='/#{classe.plurarize}/#{id}'][@onclick]")
      selenium.get_confirmation
  end
end

