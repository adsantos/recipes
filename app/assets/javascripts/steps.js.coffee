# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.add_step_textbox_to = (div_id) ->
  total = $("#{div_id} > input").size()
  $(div_id).append("<input \
    type='text' \
    name='recipe[steps][]' \
    id='recipe_steps_#{total}'>")
  $(div_id).append("<input \
    type='button' \
    id='recipe_steps_button_#{total}' \
    value='Remove step' \
    onclick='$(\"#recipe_steps_#{total},#recipe_steps_button_#{total}\").remove();'> \
    <br/>")
