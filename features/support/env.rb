# Sets up the Rails environment for Cucumber
ENV["RAILS_ENV"] ||= "test"
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')
require 'cucumber/rails/world'
require 'cucumber/formatter/unicode' # Comment out this line if you don't want Cucumber Unicode support
Cucumber::Rails.bypass_rescue # Comment out this line if you want Rails own error handling
                              # (e.g. rescue_action_in_public / rescue_responses / rescue_from)

require 'webrat'
require 'cucumber/rails/rspec'
require 'webrat/core/matchers'

require 'factory_girl'
Dir.glob(File.join(File.dirname(__FILE__), '../../spec/factories/*.rb')).each {|f| require f }

def inspecionar_erro
  begin
    yield
  rescue Exception => e
    puts e.inspect
    puts e.backtrace.join("\n")
    raise e
  end
end

