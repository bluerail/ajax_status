Gem::Specification.new do |s|
  s.name = 'jquery_ajax_status'
  s.version = '1.1'
  s.authors = ['Martin Tournoij']
  s.email = ['martin@arp242.net']
  s.license = 'MIT'
  s.homepage = 'https://github.com/bluerail/jquery_ajax_status'
  s.summary = "A simple loading indicator to show you're doing ajax requests"

  s.files = Dir['{lib}/**/*', 'MIT-LICENSE', 'README.markdown']

  s.add_dependency 'coffee-rails'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'sass'
end
