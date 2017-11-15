$(document).on 'turbolinks:load', ->
  $("#question_tag_ids").select2({
    placeholder: "Seleccionar etiquetas."
    })
