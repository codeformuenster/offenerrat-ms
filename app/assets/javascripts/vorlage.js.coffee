# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready ->
  if $("#vorlagen").length > 0
    $("ul.ohne_termin").hide()
    $("a.closed, a.open").click ->
      $(this).parent('h6').find('ul').toggle()
      $(this).toggleClass('closed')
      $(this).toggleClass('open')

