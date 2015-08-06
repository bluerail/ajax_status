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


hide_status = -> $('#ajax-status').slideUp 150, -> $('#ajax-status').remove()

show_status = ->
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


$(document).on 'ajax:before ajaxStart page:fetch', ->
  $(document.body).css 'cursor', 'wait'
  show_status.cancel()
  show_status.delay ajax_status.delay

$(document).on 'ajax:complete ajaxComplete page:change', ->
  $(document.body).css 'cursor', ''
  show_status.cancel()
  hide_status()
