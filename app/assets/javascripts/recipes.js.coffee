# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#recipe_name').bind('change keyup input', () ->
    $('#new_recipe_name').text(@value)
  )

window.add_new_ingredient = (target_id, ingredient_id, quantity_id, unit_id) ->
  # Fetch data from fields
  ingredient = $("#{ingredient_id} :selected").text()
  quantity = $(quantity_id).val()
  unit = $("#{unit_id} :selected").text()
  # Fetch next id by counting the number of 'p's
  id = $("#{target_id} > p").size()
  # Create a preview on the right hand side of the page
  $(target_id).append("<p class='ingredient'>#{ingredient} - #{quantity} - #{unit}</p>")
  # Add the value to the hidden field so that the server receives it
  $('#hidden_ingredients').append("<input type='hidden' id='recipe_ingredients_#{id}' name='recipe[ingredients][]' value='ingredient=#{ingredient}&quantity=#{quantity}&unit=#{unit}'>")
  # Clear fields
  $("#{ingredient_id},#{unit_id},#{quantity_id}").val("")

window.add_new_step = (target_id, step_id) ->
  # Fetch data from fields
  step = $(step_id).val()
  # Fetch next id by counting the number of 'p's
  id = $("#{target_id} > p").size()
  # Create a preview on the right hand side of the page
  $(target_id).append("<p id='recipe_steps_#{id}' name='recipe[steps][]' class='step'>#{step}</p>")
  # Add the value to the hidden field so that the server receives it
  $('#hidden_steps').append("<input type='hidden' id='recipe_steps_#{id}' name='recipe[steps][]' value='#{step}'>")
  # clear field
  $(step_id).val('')
