# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("#edit-rating .rating_star").click ->
    id = $(@).attr('data-rating-id')
    setStars(id)
    setValue(id)

  setStars = (id) ->
    stars = $(".rating_star")
    for star in stars
      currentId = $(star).attr('data-rating-id')
      if currentId <= id
        $(star).addClass('on')
      else 
        $(star).removeClass('on')

  setValue = (id) ->
    $("#internship_rating").val(id)

