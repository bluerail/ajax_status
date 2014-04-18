require File.expand_path('../lib/ajax_status.rb', __FILE__)
require File.expand_path('../lib/ajax_status/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'ajax_status'
  s.version = AjaxStatus::VERSION
  s.author = 'Martin Tournoij'
  s.email = 'martin@arp242.net'
  s.license = 'MIT'
  s.homepage = ''
  s.summary = "A simple loading indicator to show you're doing ajax requests"

  s.files = `find . -type f`.split($\)
  s.require_paths = ['lib']

  s.add_dependency 'coffee-rails'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'sugar-rails'
  s.add_dependency 'sass'
end
