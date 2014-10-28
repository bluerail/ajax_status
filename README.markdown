A simple loading indicator to show you're doing AJAX requests.

Works with [turbolinks](https://github.com/rails/turbolinks/).


Usage
=====

Add to your `Gemfile`

    gem 'ajax_status'

Add to your `application.js` or `application.js.coffee`
    
    // =require ajax_status

And to your `application.css` or `application.css.scss`

    /* =require ajax_status */


Configuration
=============
It should work out of the box, configuration is optional. Here are the defaults:

    window.ajax_status =
      # Show after /n/ seconds; this prevents having the loader pop-up
      constantly for requests that are near-instantanious
      delay: 500

      # Animate the background
      animate: true

      # HTML to append
      html: """<div id="ajax-status">
        <span class="ajax-status-animate"></span>
        <span class="ajax-status-text">Loading…</span>
      </div>"""


Tips
====

I want one of those spinning thingies
-------------------------------------


I want to translate the `Loading…` text
---------------------------------------


I want more configuration!
--------------------------
Adding a whole bunch of options to ~40 lines of code makes little sense IMHO.
