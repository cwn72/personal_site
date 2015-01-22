

ready = ->
  #accordions
  $('.accordion-body').hide()
  $('.accordion-label').click(->
    $(this).parent().children('.accordion-body').slideToggle()
  )

  #project hover over
  $('.project-preview').hover( ->
    $(this).children('.project-preview-overlay').toggleClass('hidden', false)
    $(this).children('.project-preview-overlay').children('h3').css({marginLeft: '-200px'})
    $(this).children('.project-preview-overlay').children('h3').animate({marginLeft: '20px'})
  , ->
    $(this).children('.project-preview-overlay').toggleClass('hidden', true)
  )


$(document).ready(ready)
$(document).on('page:load', ready)