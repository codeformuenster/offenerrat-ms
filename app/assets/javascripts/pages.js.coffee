# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('.notification').on "click", '#notif', ->
    $('#notification').toggle()
  
  $("a.gremien_color").popover()

  $("dl.districts dt ul li a").click (e)->
    e.preventDefault()
    $('dl.districts dt a.dropdown-toggle').text(this.text)
    id = $(this).data("id")
    $("dl.districts dd:visible").hide()
    $("dl.districts dd.gremium_#{id}").show()


$(document).bind "glow:flash", (evt, flash) ->
  $("#alert").removeClass()
  $("#alert").addClass "alert-#{flash.type}"
  $("#alert-wrapper").show()
  $("#alert-wrapper").delay(6000).fadeOut()
  $("#flash-messages").html flash.message

$ ->
  $("#alert-wrapper").on "click", "button#close-alert", (event) ->
    $("#alert").hide()
