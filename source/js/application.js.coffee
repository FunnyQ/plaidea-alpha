## *************************************
##
## Include plugins with asset pipeline
##
#= require _plugins
##
########################################

$(window).load ->
  $(".track-title").marquee()
  return



$ ->
  $('.player-main').on "mouseenter", ->
    bg = $(@).find('img').attr('src')
    coverBlured = $(@).find('.cover-blured')
    uiWrapper = $(@).find('.ui-wrapper')

    coverBlured.css
      "background-image": "url("+bg+")"
      "-webkit-filter": "blur(8px) saturate(2)"
    .fadeIn()
    $(@).find('.ui-wrapper').fadeIn()
    $(@).on "mouseleave", ->
      coverBlured.fadeOut()
      $(@).find('.ui-wrapper').fadeOut()
    return
  return


$ ->
  uiController = $('.ui-controller')
  uiController.on "click", ->
    if $(@).hasClass('active')
      $(@).html('<i class="fa fa-play"></i>').removeClass('active')
      return
    else
      $(@).addClass('active').html('<i class="fa fa-pause"></i>')
      return


