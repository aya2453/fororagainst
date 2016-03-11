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
    $navContent.removeClass('is-hamberger-active')

  #固定ヘッダーが自分の高さ分スクロールしたら影を付与
  $w.scroll ->
    if $(@).scrollTop() > $headerH
      $('header').addClass('box-shadow')
    else
      $('header').removeClass('box-shadow')


  class FavArticle
    constructor: ($el) ->
      @$el = $($el)
      @$likesButton = @$el.find('.js-likes-button')
      @$likesCount = @$el.find('.js-likes-count')
      @setEventListener()

    setEventListener: ->
      @$likesButton.on 'click', (e) =>
        e.preventDefault()
        @_setLikesAjax(e)

    _setLikesAjax: (e)->
      $this = $(e.currentTarget)
      $article_id = $this.closest('a').data('id')
      $unLikeURL = '/articleunlike/' + $article_id
      $likeURL = '/articlelike/' + $article_id
      if $this.hasClass('icon-fav-off')
        $.ajax({
          url: $likeURL
          type: 'POST'
          cache: false
          data: {
            'article_id': $article_id
          }
          datatype: 'json'
        })
        .done (data) =>
          $this.removeClass('icon-fav-off').addClass('icon-fav-on')
          $this.closest('a').attr('href', $unLikeURL)
          @$likesCount.text(data[0].likes_count)
      else
        $.ajax({
          url: $unLikeURL
          type: 'DELETE'
          cache: false
          data: {
            'article_id': $article_id
          }
          datatype: 'json'
        })
        .done (data) =>
          $this.removeClass('icon-fav-on').addClass('icon-fav-off')
          $this.closest('a').attr('href', $likeURL)
          @$likesCount.text(data[0].likes_count)


    favButtons = document.querySelectorAll('.js-article-likes')
    for favButton in favButtons
      new FavArticle(favButton)
