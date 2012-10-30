# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#recipe_name').bind('change keyup input', () ->
    $('#new_recipe_name').text(@value)
  )

#$ ->
#  if $('.pagination').length
#    $(window).scroll ->
#      url = $('.next > a').attr('href')
#      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 1
 #       $('.page').text('Fetching more products...')
 #       $.getScript(url)
 #     $(window).scroll()

window.append_ingredients = (ingredients) ->
  console.log ingredients
  #alert(ing.unit) for ing in ingredients
  add_new_ingredient('#ingredients', ing.name, ing.quantity, ing.unit) for ing in ingredients

window.add_new_ingredient = (target_id, ingredient, quantity, unit) ->
  # Fetch data from fields
#  ingredient = $("#{ingredient_id} :selected").text()
#  quantity = $(quantity_id).val()
#  unit = $("#{unit_id} :selected").text()
  # Fetch next id by counting the number of 'p's
  id = $("#{target_id} > p").size()
  # Create a preview on the right hand side of the page
  $(target_id).append("<p id='recipe_ingredients_#{id}_p' class='ingredient'>#{ingredient} - #{quantity} - #{unit} <a href='#' class='recipe_link' onclick=remove_from_preview('#recipe_ingredients_#{id}')> x</a></p>")
  # Add the value to the hidden field so that the server receives it
  $('#hidden_ingredients').append("<input type='hidden' id='recipe_ingredients_#{id}_hidden' name='recipe[ingredients][]' value='ingredient=#{ingredient}&quantity=#{quantity}&unit=#{unit}'>")
  # Clear fields
#  $("#{ingredient_id},#{unit_id},#{quantity_id}").val("")

window.remove_from_preview = (id_to_remove) ->
  $("#{id_to_remove}_p").remove()
  $("#{id_to_remove}_hidden").remove()

window.append_steps = (step_names) ->
  add_new_step('#steps','#new-step',step_desc) for step_desc in step_names

window.add_new_step = (target_id, step_id, step_text) ->
  # Fetch next id by counting the number of 'p's
  id = $("#{target_id} > p").size()
  # Create a preview on the right hand side of the page
  $(target_id).append("<p id='recipe_steps_#{id}_p' name='recipe[steps][]' class='step'>#{step_text}  <a href='#' class='recipe_link' onclick=remove_from_preview('#recipe_steps_#{id}')> x</a></p>")
  # Add the value to the hidden field so that the server receives it
  $('#hidden_steps').append("<input type='hidden' id='recipe_steps_#{id}_hidden' name='recipe[steps][]' value='#{step_text}'>")
  # clear field
  $(step_id).val('')
