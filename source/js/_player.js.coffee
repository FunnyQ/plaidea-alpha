###
# 播放單元
###


uiController = $('.ui-controller') # 定義 UI 控制區


$ ->
  # 當滑鼠進入主要操作區域
  $('.player-main').on "mouseenter", ->

    jplayerWrapper = $(@).find('.jplayer-wrapper')
    jplayerWrapper.jPlayer
      ready: ->
        musicTrack = $(@).attr('data-audio')
        $(this).jPlayer "setMedia",
          title: "Bubble"
          mp3: musicTrack
        return
      swfPath: "/js"
      supplied: "mp3"

    uiWrapper = $(@).find('.ui-wrapper') # 定義 UI 容器
    if uiWrapper.hasClass('active') is false
      coverBlured = $(@).find('.cover-blured') # 定義模糊效果層
      coverBlured.fadeIn(200)
      uiWrapper.fadeIn(200) # UI 介面容器淡入
  # 當滑鼠離開時
  $('.player-main').on "mouseleave", ->
    uiWrapper = $(@).find('.ui-wrapper') # 定義 UI 容器
    if uiWrapper.hasClass('active') is false # 如果 UI 容器不是啟動狀態的話
      coverBlured = $(@).find('.cover-blured') # 定義模糊效果層
      coverBlured.fadeOut(200) # 模糊效果層淡出
      uiWrapper.fadeOut(200) # UI 介面容器淡出


  # UI controller area
  uiController.on "click", (e)->

    e.preventDefault() # 取消瀏覽器預設動作

    trackTitle = $(@).parents('.player-wrapper').find('.track-title') # 找出此單元的資訊欄位
    trackTitleContent = trackTitle.find('.js-marquee').contents() # 存入此單元的資訊內容
    uiWrapper = $(@).parents('.ui-wrapper') # 定義 UI 容器
    jplayerWrapper = $(@).siblings('.jplayer-wrapper')

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

      jplayerWrapper.jPlayer "pause"

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

      jplayerWrapper.jPlayer "pauseOthers"
      jplayerWrapper.jPlayer "play", 0

      activeUI($(@)) # 開啟 UI
      uiWrapper.addClass('active') # 將 UI 容器狀態設定為啟動
      trackTitle.marquee # 將此單元的資訊欄位加入跑馬燈效果
        delayBeforeStart: 0 # 直接啟動
        duplicated: true # 自動重複
        gap: 50 # 間距 50px






  # Options btn behavior
  fundBtn = $('.ui-fund-wrapper .ui-option-btn') # 全部 fund 按鈕
  skipBtn = $('.ui-skip-wrapper .ui-option-btn') # 全部 skip 按鈕
  subscribeBtn = $('.ui-subscribe-wrapper .ui-option-btn') # 全部 subscribe 按鈕


  # 單曲訂閱行為
  trackSubscribe = (target) ->
    nextBtn = target.parents('.ui-option').find('.ui-skip-wrapper .ui-option-btn') # 找出此單元的 skip/next 按鈕
    itemWrapper = target.parents('.player-wrapper') # 找出此單元的外層容器
    # 切換狀態
    target.toggleClass('subscribed')
    itemWrapper.toggleClass('player-highlight')
    nextBtn.toggleClass('next')
    # 其他功能...

  subscribeBtn.on 'click', -> # 按下任何一個 subscribe 按鈕
    trackSubscribe($(@)) # 觸發訂閱行為
