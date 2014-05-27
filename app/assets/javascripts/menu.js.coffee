$(document).ready ->

  $(document).on 'click', '#menu-base-button', ->
    $('.menu-wrapper').toggle()
    return false

