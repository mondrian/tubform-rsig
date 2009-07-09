RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'mislav-will_paginate', :lib => 'will_paginate', :source => 'http://gems.github.com'

  config.gem "calendar_date_select"

  config.frameworks -= [ :action_mailer ]

  config.time_zone = 'UTC'

  config.gem "thoughtbot-factory_girl", :lib    => "factory_girl", :source => "http://gems.github.com"

  config.i18n.default_locale = :'pt-BR'

end

I18n.localize_core = true

