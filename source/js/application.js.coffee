## *************************************
##
##   [Project Name] - Q.Style v1.0.alpha
##   -> Manifest
##
## *************************************
##
## Include plugins with asset pipeline
##
#= require _plugins
##
########################################

$(window).load ->
  # $(".track-title").marquee()
  return

$ ->
  $('.player-main').on "mouseenter", ->
    bg = $(@).find('img').attr('src')
    $(@).find('.cover-blured').css
      "background-image": "url("+bg+")"
      "-webkit-filter": "blur(8px)"
    .fadeIn()
  $('.player-main').on "mouseleave", ->
    $(@).find('.cover-blured').fadeOut()
    return

