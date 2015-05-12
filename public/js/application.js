$(document).ready(function() {


  $('.container').on('click', '.sign-up', function(e) {
    e.preventDefault();
    $('#sign-in').attr('action', '/signup')
    $('#sign-in').find('input[value="Sign In"]').val("Sign Up")
    $('#sign-in').find('h1').text("Sign Up")
  });


  $('.container').on('click', '.sign-in', function(e) {
    e.preventDefault();
    $('#sign-in').attr('action', '/signin')
    $('#sign-in').find('input[value="Sign Up"]').val("Sign In")
    $('#sign-in').find('h1').text("Sign In")
  });


});
