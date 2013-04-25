# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

set_stars = (form_id, stars) ->
  i = 1
  while i <= 5
    if i <= stars
      $("#" + form_id + "_" + i).addClass "on"
    else
      $("#" + form_id + "_" + i).removeClass "on"
    i++

$ ->
  $(".rating_star").click ->
    star = $(this)
    form_id = $(this).attr("data-form-id")
    stars = $(this).attr("data-stars")
    set_stars form_id, stars
    $("#" + form_id + "_stars").val stars
    $.ajax
      type: "post"
      url: $("#" + form_id).attr("action")
      data: $("#" + form_id).serialize()


  $(".star_rating_form").each ->
    form_id = $(this).attr("id")
    stars = $("#" + form_id + "_stars").val()
    set_stars form_id, stars