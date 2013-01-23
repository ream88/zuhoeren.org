jQuery ->
  $button = $('#button')
  
  $button.addClass 'offline'

  $('input').click (e) ->
    e.preventDefault()
    $button.removeClass().addClass $(e.target).attr('id')