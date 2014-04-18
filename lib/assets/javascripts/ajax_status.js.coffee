window.ajax_status =
  delay: 500
  animate: true
  html: """<div id="ajax-status">
    <span class="ajax-status-animate"></span>
    <span class="ajax-status-text">Loading…</span>
  </div>"""


hide_status = -> $('#ajax-status').slideUp 150, -> $('#ajax-status').remove()

show_status = ->
  $(document.body).append ajax_status.html

  $('#ajax-status').slideDown 150, ->
    return unless ajax_status.animate

    fun = ->
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
