$(document).ready(function() {

  $('#attachments_div').on('click','a.remove_fields', function(event) {
	$(this).prev().val('true');
	$(this).closest('fieldset').hide();
    return event.preventDefault();
  });

  $('.add_fields').on('click', function(event) {
    var regexp, time;

    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    return event.preventDefault();

  });
})