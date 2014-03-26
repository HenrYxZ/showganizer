var Showganizer =  (function(m, undefined) {

  m.validateRequired = function(form) {

          $(form).on("submit", function(e) {
            var error = false;
            var $this = $(this);
            var $required_fields = $this.find("[data-validate=required]");
            
            for(var i = 0, len = $required_fields.length; i < len; i++) {
              var $field = $($required_fields[i]);
              var value = $field.val();
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
            
            if (error) {
              e.preventDefault();
            }
          });
    
  };
  return m;

}(Showganizer || {}));