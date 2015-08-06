Gem::Specification.new do |s|
  s.name = 'ajax_status'
  s.version = '1.0'
  s.authors = ['Martin Tournoij']
  s.email = ['martin@arp242.net']
  s.license = 'MIT'
  s.homepage = 'https://github.com/bluerail/ajax_status'
  s.summary = "A simple loading indicator to show you're doing ajax requests"

  s.files = Dir['{lib}/**/*', 'MIT-LICENSE', 'README.markdown']

  s.add_dependency 'coffee-rails'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'sugar-rails'
  s.add_dependency 'sass'
end
