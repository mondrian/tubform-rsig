# Sets up the Rails environment for Cucumber
ENV["RAILS_ENV"] ||= "test"
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')
require 'cucumber/rails/world'
require 'cucumber/formatter/unicode' # Comment out this line if you don't want Cucumber Unicode support
#Cucumber::Rails.use_transactional_fixtures
Cucumber::Rails.bypass_rescue # Comment out this line if you want Rails own error handling
                              # (e.g. rescue_action_in_public / rescue_responses / rescue_from)

require 'webrat'

Webrat.configure do |config|
  config.mode = :selenium
  # opcional:
  # padrão é 3001. Evitar a porta padrão do Selenium, 4444
  config.application_port = 4567
  config.application_framework = :rails
  config.application_environment = :test
end

World(Webrat::Selenium::Matchers)

require 'cucumber/rails/rspec'
require 'webrat/core/matchers'

require 'factory_girl'
Dir.glob(File.join(File.dirname(__FILE__), '../../spec/factories/*.rb')).each {|f| require f }

# Hack para sobrescrever o comportamento do webrat de forma a esperar a resposta do
# browser - quando houver a correção remover isso
module Webrat
  class SeleniumSession
    def response_body
      sleep 0.5
      selenium.get_html_source
    end
  end
end

