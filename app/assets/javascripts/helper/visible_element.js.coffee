$.fn.visible = ->
  win = $(window)
  viewport =
    top: win.scrollTop()
    left: win.scrollLeft()

  viewport.right = viewport.left + win.width()
  viewport.bottom = viewport.top + win.height()
  bounds = @offset()
  bounds.right = bounds.left + @outerWidth()
  bounds.bottom = bounds.top + @outerHeight()
  not (viewport.right < bounds.left or viewport.left > bounds.right or viewport.bottom < bounds.top or viewport.top > bounds.bottom)