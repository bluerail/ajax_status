Gem::Specification.new do |s|
  s.name = 'ajax_status'
  s.version = '1.0'
  s.author = 'Martin Tournoij'
  s.email = 'martin@arp242.net'
  s.license = 'MIT'
  s.homepage = ''
  s.summary = "A simple loading indicator to show you're doing ajax requests"

  s.files = `find . -type f`.split($\)

  s.add_dependency 'coffee-rails'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'sugar-rails'
  s.add_dependency 'sass'
end
