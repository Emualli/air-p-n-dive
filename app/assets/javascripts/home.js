$(document).ready(function(){
    $('#datepicker').on('click', function(e) {
      $(this).datepicker({
        format: 'dd/mm/yyyy',
        startDate: '-3d'
      });
    });
  });
