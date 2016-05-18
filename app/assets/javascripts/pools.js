// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  $('#booking_start_time').datetimepicker({
    format: "HH:mm"
  });
  $('#booking_end_time').datetimepicker({
    format: "HH:mm"
  });
});
