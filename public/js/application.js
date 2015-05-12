$(document).ready(function() {


  $('.container').on('click', '.sign-up', function(e) {
    e.preventDefault();
    $('#sign-up').css('display', 'inline');
    $('.sign-in').css('display', 'none');
    $('.sign-up').css('display', 'none');
  });


});
