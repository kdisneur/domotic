$ ->
  $('#listing-lamps .pagination a').live 'click', (event) ->
    $.get $(@).attr("href"), (result) ->
      $('#listing-lamps').html(result)
      
    false