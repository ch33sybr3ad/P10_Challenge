$(document).ready(function() {


  $('.container').on('click', '.sign-up', function(e) {
    e.preventDefault();
    $('#register').attr('action', '/signup')
    $('#register').find('input[value="Sign In"]').val("Sign Up")
    $('#register').find('h1').text("Sign Up")
    $('.home-signin').addClass('home-signup').removeClass('home-signin')
  });


  $('.container').on('click', '.sign-in', function(e) {
    e.preventDefault();
    $('#register').attr('action', '/signin')
    $('#register').find('input[value="Sign Up"]').val("Sign In")
    $('#register').find('h1').text("Sign In")
    $('.home-signup').addClass('home-signin').removeClass('home-signup')
  });

  $('body').on('click', '.home-signin', function(e) {
    e.preventDefault();
    current = $(this).parent();
    username_val = current.find("input[name='username']").val();
    password_val = current.find("input[name='password']").val();
    $.ajax({
      url: current.attr('action'),
      type: 'POST',
      data: {username: username_val, password: password_val}
    }).done(function(){
      current.parent().find("input[name='username']").val("");
      current.parent().find("input[name='password']").val("");
      $('.before-sign-in').css('display','none');
      $('.after-sign-in').css('display','inline-block');
      $('#register').find('h1').text("Welcome");
    });
  });

  $('body').on('click', '.home-signup', function(e) {
    e.preventDefault();
    current = $(this).parent();
    username_val = current.find("input[name='username']").val();
    password_val = current.find("input[name='password']").val(); 
     $.ajax({
      url: current.attr('action'),
      type: 'POST',
      data: {username: username_val, password: password_val}
    }).done(function() {
      current.parent().find("input[name='username']").val("");
      current.parent().find("input[name='password']").val("");
      $('.before-sign-in').css('display','none');
      $('.after-sign-in').css('display','inline-block');
      $('#register').find('h1').text("Welcome");
    });
  });

});
