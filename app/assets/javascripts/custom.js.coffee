

ready = ->
  #accordions
  $('.accordion-body').hide()
  $('.accordion-label').click(->
    $(this).parent().children('.accordion-body').slideToggle()
  )


$(document).ready(ready)
$(document).on('page:load', ready)