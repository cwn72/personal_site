#resume presentation
slideTree = null
currentPosition = {
  x: 0,
  y: 0
}
duration = 1200

ready = ->
  #build slide tree
  slideTree = buildSlideTree()
  alignUpButton()
  hideAllButCurrent()
  checkButtons()
  $('.btn-down').click( ->
    slideUp()
  )
  $('.btn-up').click( ->
    slideDown()
  )
  $('.btn-right').click( ->
    slideLeft()
  )
  $('.btn-left').click( ->
    slideRight()
  )
  $('body').keypress( (event) ->
    code = event.keyCode || event.which
    if code == 38
      slideDown()
    else if code == 37
      slideRight()
    else if code == 40
      slideUp()
    else if code == 39
      slideLeft()
  )

$(document).ready(ready)
$(document).on('page:load', ready)


#get slide at x,y
getSlide = (x, y) ->
  return slideTree[y][x]

#gets the current slide
getCurrentSlide = ->
  return getSlide(currentPosition.x,currentPosition.y)

#builds a slide tree
buildSlideTree = ->
  tree = []
  containers = $('.slide-container')
  for i in [0..containers.length - 1]
    tree[i] = []
    slides = containers.eq(i).children('.slide')
    for h in [0..slides.length - 1]
      tree[i][h] = slides.eq(h)
  return tree

#gets the container of a slide
getSlideContainer = (slide) ->
  return slide.parent()

#hides a slide
hideSlide = (slide) ->
  slide.toggleClass('hidden', true)

#hides everything but current slide
hideAllButCurrent = ->
  containers = $('.slide-container')
  for i in [0..containers.length - 1]
    slides = containers.eq(i).children('.slide')
    if currentPosition.y != i
      containers.eq(i).toggleClass('hidden', true)
    for h in [0..slides.length - 1]
      if currentPosition.x != h || currentPosition.y != i
        slides.eq(h).toggleClass('hidden', true)

#slide slides up
slideUp = ->
  if !hasSlidesDown
    return
  adjX = findAdjustedX(currentPosition.y+1)
  nextSlide = getSlide(adjX,currentPosition.y+1)
  currSlide = getCurrentSlide()
  #position next slide
  nextSlide.parent().css({top: '100vh'})
  #make sure next slide is not hidden
  nextSlide.parent().toggleClass('hidden', false)
  nextSlide.toggleClass('hidden', false)
  #disable all buttons
  disableAllButtons()
  #animate slide
  nextSlide.parent().animate({top: '0vh'}, duration)
  currSlide.parent().animate({top: '-100vh'}, duration, ->
    #hide last slide
    hideSlide(currSlide)
    #advance slide counter
    currentPosition.x = adjX
    currentPosition.y++
    #check buttons
    checkButtons()
  )

#slide slides down
slideDown = ->
  if !hasSlidesUp
    return
  adjX = findAdjustedX(currentPosition.y-1)
  nextSlide = getSlide(adjX,currentPosition.y-1)
  currSlide = getCurrentSlide()
  #position next slide
  nextSlide.parent().css({top: '-100vh'})
  #make sure next slide is not hidden
  nextSlide.parent().toggleClass('hidden', false)
  nextSlide.toggleClass('hidden',false)
  #disable all buttons
  disableAllButtons()
  #animate slide
  nextSlide.parent().animate({top: '0vh'}, duration)
  currSlide.parent().animate({top: '100vh'}, duration, ->
    #hide last slide
    hideSlide(currSlide)
    #advance slide counter
    currentPosition.x = adjX
    currentPosition.y--
    #check buttons
    checkButtons()
  )


#slide slides left
slideLeft = ->
  if !hasSlidesRight()
    return
  nextSlide = getSlide(currentPosition.x+1, currentPosition.y)
  currSlide = getCurrentSlide()
  #position next slide
  nextSlide.css({left: '100vw'})
  #make sure next slide is not hidden
  nextSlide.parent().toggleClass('hidden', false)
  nextSlide.toggleClass('hidden', false)
  #disable all buttons
  disableAllButtons()
  #animate slide
  nextSlide.animate({left: '0vw'}, duration)
  currSlide.animate({left: '-100vw'}, duration, ->
    #hide last slide
    hideSlide(currSlide)
    #advance slide counter
    currentPosition.x++
    #checkButtons
    checkButtons()
  )

#slide slides right
slideRight = ->
  if !hasSlidesLeft()
    return
  nextSlide = getSlide(currentPosition.x-1, currentPosition.y)
  currSlide = getCurrentSlide()
  #position next slide
  nextSlide.css({left: '-100vw'})
  #make sure next slide is not hidden
  nextSlide.parent().toggleClass('hidden', false)
  nextSlide.toggleClass('hidden', false)
  #disable buttons
  disableAllButtons()
  #animate slide
  nextSlide.animate({left: '0vw'}, duration)
  currSlide.animate({left: '100vw'}, duration, ->
    #hide last slide
    hideSlide(currSlide)
    #advance slide counter
    currentPosition.x--
    #check buttons
    checkButtons()
  )

hasSlidesLeft = ->
  return currentPosition.x > 0

hasSlidesRight = ->
  return currentPosition.x < slideTree[currentPosition.y].length - 1

hasSlidesUp = ->
  return currentPosition.y > 0

hasSlidesDown = ->
  return currentPosition.y < slideTree.length - 1

#disables unavailable buttons, ensures available buttons are enabled
checkButtons = ->
  $('.btn-up').toggleClass('disabled', !hasSlidesUp())
  $('.btn-down').toggleClass('disabled', !hasSlidesDown())
  $('.btn-left').toggleClass('disabled', !hasSlidesLeft())
  $('.btn-right').toggleClass('disabled', !hasSlidesRight())

#disables all buttons
disableAllButtons = ->
  $('.btn').toggleClass('disabled', true)

#used in up/down slide operations to see if there is a different
#slide set, other than slide at index 0
findAdjustedX = (y)->
  for i in [0..slideTree[y].length-1]
    if slideTree[y][i].css('left') == '0px'
      return i
  return 0

#aligns the up button with the down button
alignUpButton = ->
  mLeft = $('.btn-down').offset().left - $('.stage-controls').offset().left
  $('.btn-up').css(marginLeft: mLeft)