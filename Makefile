all:
	coffee -c lib/assets/javascripts/jquery_ajax_status.js.coffee
	mv -f lib/assets/javascripts/jquery_ajax_status.js.js lib/assets/javascripts/jquery_ajax_status.js
	sass lib/assets/stylesheets/jquery_ajax_status.sass lib/assets/stylesheets/jquery_ajax_status.css
