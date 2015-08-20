[![Gem Version](https://badge.fury.io/rb/jquery_ajax_status.svg)](http://badge.fury.io/rb/jquery_ajax_status)

A simple loading indicator to show you're doing AJAX requests.

[Here's a demo](https://cdn.rawgit.com/bluerail/jquery_ajax_status/8b38a7c40f8c3871981ade7c90a0c39df4495a11/demo.html)


Usage
=====
Include the [JavaScript code](https://github.com/bluerail/jquery_ajax_status/tree/master/lib/assets/javascripts)
and the [stylesheet](https://github.com/bluerail/jquery_ajax_status/tree/master/lib/assets/stylesheets).
For Ruby on Rails, you can use the gem (see below).

We automatically hook into jQuery callbacks.

Ruby on Rails installation
--------------------------
This is packaged as a Ruby gem ready to use in a Rails app.

Add to your `Gemfile`

    gem 'jquery_ajax_status'

Add to your `application.js`:

    // =require jquery_ajax_status

And to your `application.css`:

    /* =require jquery_ajax_status */


Configuration
=============
It should work out of the box, configuration is optional. Here are the defaults:

    window.ajax_status = {
      // Show after /n/ milliseconds; this prevents having the loader pop-up
      // constantly for requests that are near-instantaneous
      delay: 500,

      // Animate the background
      animate: true,

      // CSS class to add; %%CLASS%% in html is replaced by this
      class: 'ajax-status-default',

      // Text to use; %%TEXT%% in html is replaced by this
      text: 'Loading…',

      // HTML to append
      html: "<div id="ajax-status" class="%%CLASS%%">" +
        "<span class="ajax-status-animate"></span>" +
        "<span class="ajax-status-text">%%TEXT%%</span>" +
      </div>"
    }

You can change a setting with:

    window.ajax_status.delay = 2000

*Do not* override the entire `window.ajax_status` object, as this also includes
the code to make it run.


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


I want to start it manually
---------------------------
Use `window.ajax_status.start` and `window.ajax_status.stop`.

For example:

    # Unbind the default events
    $(document).off 'ajaxStart page:fetch', window.ajax_status.start
    $(document).off 'ajaxComplete page:change', window.ajax_status.stop

    # And the turbolink events
    $(document).off 'page:fetch', window.ajax_status.start
    $(document).off 'page:change', window.ajax_status.stop

    # Trigger for this ajax call
    jQuery.ajax
      url: '/foo'
      beforeSend: window.ajax_status.start
      complete: window.ajax_status.stop
      success: (data) ->
        # ...
      error: ->
        # ...


I don't like the {colors,font size,position,etc}
------------------------------------------------
You have 2 options:

- Change `window.ajax_status.class` to something else; you still get some CSS
  from the `#ajax-status` id, but this is what most people want.
- Don't include my CSS and write your own.


I want more configuration!
--------------------------
Submit a patch ;-)
