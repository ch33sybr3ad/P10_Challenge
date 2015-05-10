$(document).ready(function() {

  $('.container').on('click', '.sign-in', function(e) {
    e.preventDefault();
    alert("hello!")
    $('#sign-in').css('display', 'inline');
    $('.sign-in').css('display', 'none');
    $('.sign-up').css('display', 'none');
  });

  $('.container').on('click', '.sign-up', function(e) {
    e.preventDefault();
    alert("hello! OOOOO")
    $('#sign-up').css('display', 'inline');
    $('.sign-in').css('display', 'none');
    $('.sign-up').css('display', 'none');
  });


});
