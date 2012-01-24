$ ->
  $('label.add-on input:checkbox').live 'click', (event) ->
    current_checkbox  = $(@)
    already_used      = current_checkbox.parent('label').hasClass 'already-use'

    if already_used
      $('#lamp-already-use-in-another-room').data('checkbox', current_checkbox)
      $('#lamp-already-use-in-another-room').modal 'show'
      current_checkbox.attr('checked', false);
      return
    
    update_checkbox current_checkbox

$ ->
  $('#lamp-already-use-in-another-room a.btn.primary').bind 'click', (event) ->
    checkbox = $('#lamp-already-use-in-another-room').data('checkbox')
    checkbox.parent('label').removeClass 'already-use'
    checkbox.attr('checked', true);
    update_checkbox checkbox
    $('#lamp-already-use-in-another-room').modal 'hide'
  
  $('#lamp-already-use-in-another-room a.btn.secondary').bind 'click', (event) ->
    $('#lamp-already-use-in-another-room').modal 'hide'

update_checkbox = (checkbox) ->
  room = if checkbox.is(':checked') then checkbox.attr('room') else ""

  $.post(
    checkbox.attr('url'),
    { '_method' : 'put', 'lamp[room_id]' : room },
    (result) ->
      if checkbox.is(':checked')
        checkbox.parent('label').addClass 'active'        
      else
        checkbox.parent('label').removeClass 'active'
  )