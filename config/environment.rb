# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  #  config.gem "searchlogic"
  config.gem "newrelic_rpm"
  config.gem "authlogic"
  config.gem "formtastic"
  config.gem 'will_paginate', :source => 'http://gemcutter.org'
  config.gem 'translator', :sounce => 'http://gemcutter.org'
  config.gem 'inherited_resources', :source => 'http://gemcutter.org'
  config.gem 'less'

  config.load_paths << "#{RAILS_ROOT}/lib"
  %w().each do |dir|
    config.load_paths << "#{RAILS_ROOT}/app/#{dir}"
  end

  config.time_zone = 'UTC'
  config.i18n.default_locale = :es

  config.action_controller.resources_path_names = { :new => 'crear', :edit => 'editar' }
  config.action_controller.page_cache_directory = RAILS_ROOT + "/public/cache/"
end