A simple loading indicator to show you're doing AJAX requests.

Works with [turbolinks](https://github.com/rails/turbolinks/).

[Here's a demo](https://cdn.rawgit.com/bluerail/ajax_status/master/demo.html)


Usage
=====

Add to your `Gemfile`

    gem 'ajax_status'

Add to your `application.js`:

    // =require ajax_status

And to your `application.css`:

    /* =require ajax_status */


Configuration
=============
It should work out of the box, configuration is optional. Here are the defaults:

    window.ajax_status =
      # Show after /n/ seconds; this prevents having the loader pop-up
      # constantly for requests that are near-instantanious
      delay: 500

      # Animate the background
      animate: true

      # CSS class to add; %%CLASS%% in html is replaced by this
      class: 'ajax-status-default'

      # Text to use; %%TEXT%% in html is replaced by this
      text: 'Loading…'

      # HTML to append
      html: """<div id="ajax-status" class="%%CLASS%%">
        <span class="ajax-status-animate"></span>
        <span class="ajax-status-text">%%TEXT%%</span>
      </div>"""

You can change a setting with:

    window.ajax_status.delay = 2000


Tips
====

I want one of those spinning thingies
-------------------------------------
You can override `window.ajax_status.text` to use a different text. This can
also be HTML:

    window.ajax_status.animate = false
    window.ajax_status.text = '<i class="fa fa-spinner fa-spin"></i>'


I want to translate the `Loading…` text
---------------------------------------
Again, override `window.ajax_status.text`, for example for gettext:

    window.ajax_status.text = _('Loading')


I don't like the {colors,font size,position,etc}
------------------------------------------------
You have 2 options:

- Change `window.ajax_status.class` to something else; you still get some CSS
  from the `#ajax-status` id, but this is what most people want.
- Don't include my CSS and write your own.


I want more configuration!
--------------------------
Adding a whole bunch of options to ~40 lines of code makes little sense IMHO.
