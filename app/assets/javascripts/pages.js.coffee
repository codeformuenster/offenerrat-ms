# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery(document).ready ()  ->
  $("a.gremien_color").popover()

  $("dl.districts dt ul li a").click (e)->
    e.preventDefault()
    $('dl.districts dt a.dropdown-toggle').text(this.text)
    id = $(this).data("id")
    $("dl.districts dd:visible").hide()
    $("dl.districts dd.gremium_#{id}").show()
