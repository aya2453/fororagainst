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