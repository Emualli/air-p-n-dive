// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
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
