// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

/**
Validación "required" a cualquier campo con data-validate=required.
*/
$(function validateRequired(){
  $("#new_show").on("submit", function(e) {
    var error = false;
    var $this = $(this);
    var $required_fields = $this.find("[data-validate=required]");
    
    for(var i = 0, len = $required_fields.length; i < len; i++) {
      var $field = $($required_fields[i]);
      var value = $field.val();
      console.log(value)
      if (!value || value.trim().length === 0) {
        error = true;
        $field.parent().addClass("field_with_errors");
        $errorMessage = $field.next('span.error-message');
        if($errorMessage.length === 0) {
          $errorMessage = $('<span class="error-message"></span>').insertAfter($field);
        }
        $errorMessage.html('es requerido');
      } else {
        // clear error
        $field.parent().removeClass('field_with_errors');
        $field.next('span.error-message').hide();
      }
    }

    // TODO: crear una clase que encapsule este comportamiento, o al menos extraerlo a una función    
    
    if (error) {
      e.preventDefault();
    }
  });
});


/*
  Esto nos permite escuchar cuando llegue la respuesta Ajax (que en estos momentos
  es sólo un trozo de HTML) y usar esa trozo para insertarlo en review-container.
*/

$(document).ready(function (){
  $("#video-upload").click(function (){
    $("#video-info").toggle();
    $("#review-container").toggle(false);
    $("#form-upload-image-container").toggle(false);
    $("#form-create-link").toggle(false);
    $("#reviews").toggle(false);
  });
});

$(document).ready(function (){
  $("a#write-review").click(function (){
    $("#review-container").toggle();
    $("#form-upload-image-container").toggle(false);
    $("#form-create-link").toggle(false);
    $("#reviews").toggle(false);
    $("#video-info").toggle(false);
     $(".notice").html("");
  });
});

$(document).ready(function (){
  $("a#list-reviews").click(function (){
    $("#reviews").toggle();
    $("#video-info").toggle(false);
    $("#form-upload-image-container").toggle(false);
    $("#review-container").toggle(false);
    $("#form-create-link").toggle(false);
  });
});

$(document).ready(function (){
  $("a#image-upload").click(function (){
    $("#form-upload-image-container").toggle();
    $("#review-container").toggle(false);
    $("#video-info").toggle(false);
    $("#form-create-link").toggle(false);
    $("#reviews").toggle(false);
     $(".notice").html("");
  });
});

$(document).ready(function (){
  $("a#link-add").click(function (){
    $("#form-upload-image-container").toggle(false);
    $("#review-container").toggle(false);
    $("#video-info").toggle(false);
    $("#form-create-link").toggle();
    $("#reviews").toggle(false);
     $(".notice").html("");
  });
});


$(window).load(function() {
  $('.flexslider').flexslider({
    animation: "slide"
  });
  $(function() {
    $( "#show_end_date" ).datepicker({
      dateFormat: 'dd-mm-yy',
      minDate: getFormattedDate(new Date())
    });
  });
  $(function() {
    $( "#show_start_date" ).datepicker({
      dateFormat: 'dd-mm-yy',
      minDate: getFormattedDate(new Date())
    });
  });
});

function getFormattedDate(date) {
    var day = date.getDate();
    var month = date.getMonth() + 1;
    var year = date.getFullYear().toString().slice(2);
    return day + '-' + month + '-' + year;
}
