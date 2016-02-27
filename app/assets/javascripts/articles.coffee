$ ->
  #メニュー現在地表示
  urlQuery = window.location.search
  urlPath = window.location.pathname
  # URLクエリが一致したa要素にクラス追加
  if urlQuery isnt ''
    $('.tabs-menu a[href="/'+urlQuery+'"]').addClass('is-menu-active')
  # URLパスが一致したa要素にクラス追加
  else
    $('.tabs-menu a[href="'+urlPath+'"]').addClass('is-menu-active')

  $w = $(window)
  $windowH = $w.height()
  $headerH = $('header').height()
  $navContent = $('.nav-content')
  $contents = $('#contents')
  $contents.prepend('<div class="overlay"></div>')

  #メニューおよびオーバーレイ表示/非表示
  $('.hamberger-menu-tigger').click ->
    $navContent.toggleClass('is-hamberger-active')
    $navContent.css('height', $windowH)
    $('.overlay').fadeToggle()

  $('.overlay').click ->
    $(@).fadeOut()
    $navContent.removeClass 'is-hamberger-active'

  #固定ヘッダーが自分の高さ分スクロールしたら影を付与
  $w.scroll ->
    if $(@).scrollTop() > $headerH
      $('header').addClass('box-shadow')
    else
      $('header').removeClass('box-shadow')