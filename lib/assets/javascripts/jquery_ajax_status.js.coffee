timer = null

window.ajax_status =
  # Show after /n/ milliseconds; this prevents having the loader pop-up
  # constantly for requests that are near-instantaneous
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


  # Functions

  # Start showing it after the delay
  start: ->
    $(document.body).css 'cursor', 'wait'
    clearTimeout timer
    timer = setTimeout window.ajax_status.show, ajax_status.delay


  # Stop showing the status
  stop: ->
    $(document.body).css 'cursor', ''
    clearTimeout timer
    window.ajax_status.hide()


  # Hide the widget
  hide: ->
    $('#ajax-status').slideUp 150, -> $('#ajax-status').remove()


  # Show the widget
  show: ->
    $(document.body).append(ajax_status.html
      .replace('%%TEXT%%', window.ajax_status.text)
      .replace('%%CLASS%%', window.ajax_status.class))

    $('#ajax-status').slideDown 150, ->
      return unless ajax_status.animate

      fun = ->
        return if $('#ajax-status .ajax-status-animate').length is 0 or not ajax_status.animate
        $('#ajax-status .ajax-status-animate')
          .css 'left', "-#{$('#ajax-status .ajax-status-animate').outerWidth()}px"
          .animate {
            left: "#{$('#ajax-status').outerWidth()}px"
          }, {
            duration: 2000
            complete: fun
          }
      fun()


# Hook into jQuery events
$(document).on 'ajaxStart', window.ajax_status.start
$(document).on 'ajaxComplete', window.ajax_status.stop

# ... and into turbolinks
$(document).on 'page:fetch', window.ajax_status.start
$(document).on 'page:change', window.ajax_status.stop
