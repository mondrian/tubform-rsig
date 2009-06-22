Webrat.configure do |config|
  config.mode = :selenium
end

World(Webrat::Selenium::Matchers)

Before do
  # @jefferson - Esvaziar tabelas aqui, já estou analisando uma gem que
  # faz esse processo automaticamente
end

# Hack para sobrescrever o comportamento do webrat de forma a esperar a resposta do
# browser - quando houver a correção remover isso
#module Webrat
#  class SeleniumSession
#    def response_body
#      sleep 1.0
#      selenium.get_html_source
#    end
#  end
#end

