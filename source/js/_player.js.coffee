###
# 播放單元
###


uiController = $('.ui-controller') # 定義 UI 控制區


$ ->
  # 當滑鼠進入主要操作區域
  $('.player-main').on "mouseenter", ->


    uiWrapper = $(@).find('.ui-wrapper') # 定義 UI 容器

    if uiWrapper.hasClass('active') is false

      coverBlured = $(@).find('.cover-blured') # 定義模糊效果層

      coverBlured.fadeIn(200)
      uiWrapper.fadeIn(200) # UI 介面容器淡入

    $(@).on "mouseleave", -> # 當滑鼠離開時
      if uiWrapper.hasClass('active') is false # 如果 UI 容器不是啟動狀態的話
        coverBlured.fadeOut(200) # 模糊效果層淡出
        uiWrapper.fadeOut(200) # UI 介面容器淡出



  # 當 UI 控制區被點擊時
  uiController.on "click", (e)->

    e.preventDefault() # 取消瀏覽器預設動作

    trackTitle = $(@).parents('.player-wrapper').find('.track-title') # 找出此單元的資訊欄位
    trackTitleContent = trackTitle.find('.js-marquee').contents() # 存入此單元的資訊內容
    uiWrapper = $(@).parents('.ui-wrapper') # 定義 UI 容器

    # 關閉 UI 功能
    deactiveUI = (target) ->
      target.html('<i class="fa fa-play"></i>').removeClass('active')

    # 開啟 UI 功能
    activeUI = (target) ->
      target.addClass('active').html('<i class="fa fa-pause"></i>')

    if $(@).hasClass('active') #如果這個 UI 控制區是啟動狀態
      deactiveUI($(@)) # 關閉 UI
      uiWrapper.removeClass('active') # 移除 UI 容器的啟動狀態
      trackTitle.marquee('destroy').html(trackTitleContent) # 停止跑馬燈並塞回原本的正確資訊內容
    else # 否則

      activedItem = $('.ui-wrapper.active') # 定義已啟動的 UI 容器
      coverBlured = activedItem.siblings('.cover-blured') # 定義已啟動的模糊效果層
      activedTrackTitle = activedItem.parents('.player-wrapper').find('.track-title') # 定義已啟動的資訊欄位
      activedTrackTitleContent = activedTrackTitle.find('.js-marquee').contents() # 儲存已啟動的資訊欄位內容
      activedUiController = activedItem.find('.ui-controller') # 定義已啟動的單元 UI 控制區

      activedItem.removeClass('active').hide() # 移除已啟動 UI 容器的啟動狀態並淡出
      coverBlured.hide() # 淡出已啟動的模糊效果層
      activedTrackTitle.marquee('destroy').html(activedTrackTitleContent) # 移除已啟動的資訊欄位跑馬燈效果，填入原始內容
      activedUiController.html('<i class="fa fa-play"></i>').removeClass('active') # 將播放符號設定為「play」

      activeUI($(@)) # 開啟 UI
      uiWrapper.addClass('active') # 將 UI 容器狀態設定為啟動
      trackTitle.marquee # 將此單元的資訊欄位加入跑馬燈效果
        delayBeforeStart: 0 # 直接啟動
        duplicated: true # 自動重複
        gap: 50 # 間距 50px
