// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
  $('#booking_date').datepicker({
    format: 'dd/mm/yyyy',
    startDate: '-3d',
    datesDisabled: ['15/05/2016', '25/05/2016']
  });

  $('.tab').on('click', function() {
    $('.tab').removeClass('active');
    $(this).addClass('active');
  });
  $('#customer').on('click', function() {
    $('#display_customer').addClass('active');
    $('#display_owner').removeClass('active');
  });
  $('#owner').on('click', function() {
    $('#display_customer').removeClass('active');
    $('#display_owner').addClass('active');
  });
});
