## *************************************
##
## Include plugins with asset pipeline
##
#= require _plugins
##
########################################

uiController = $('.ui-controller') # 定義 UI 控制區

$ ->
  # 當滑鼠進入主要操作區域
  $('.player-main').on "mouseenter", ->

    bg = $(@).find('img').attr('src') # 找出封面圖片的 path
    coverBlured = $(@).find('.cover-blured') # 定義模糊效果層
    uiWrapper = $(@).find('.ui-wrapper') # 定義 UI 容器

    # 模糊效果層的背景指定為封面圖片，加入模糊效果並增加飽和度 -> 淡入
    coverBlured.css
      "background-image": "url("+bg+")"
      "-webkit-filter": "blur(8px) saturate(2)"
    .fadeIn()

    uiWrapper.fadeIn() # UI 介面容器淡入

    $(@).on "mouseleave", -> # 當滑鼠離開時
      coverBlured.fadeOut() # 模糊效果層淡出
      $(@).find('.ui-wrapper').fadeOut() # UI 介面容器淡出

  # 當 UI 控制區被點擊時
  uiController.on "click", (e)->

    e.preventDefault() # 取消瀏覽器預設動作

    trackTitle = $(@).parents('.player-wrapper').find('.track-title') # 找出此單元的資訊欄位
    trackTitleContent = trackTitle.find('.js-marquee').contents() # 存入此單元的資訊內容

    if $(@).hasClass('active') #如果這個 UI 控制區是啟動狀態
      $(@).html('<i class="fa fa-play"></i>').removeClass('active') # 將播放符號變更為「Play」，並移除啟動狀態 class
      trackTitle.marquee('destroy').html(trackTitleContent) # 停止跑馬燈並塞回原本的正確資訊內容
    else # 否則
      $(@).addClass('active').html('<i class="fa fa-pause"></i>') # 將此 UI 控制區加入啟動狀態 class，並將播放福告變更為「Pause」
      trackTitle.marquee # 將此單元的資訊欄位加入跑馬燈效果
        delayBeforeStart: 0 # 直接啟動
        duplicated: true # 自動重複
        gap: 50 # 間距 50px


