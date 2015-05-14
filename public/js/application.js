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
      $('.sbuttons').css('display','none');
      $('#register').remove()
      $('.aftersignin').fadeIn(1500)
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
      $('.sbuttons').css('display','none');
      $('#register').remove()
      $('.aftersignin').fadeIn(1500)
    });
  });

  $('body').on('submit', '.savefavform', function(e) {
    e.preventDefault();
    current = $(this)
    job_index = $($(this).find('p')[0]).text()
    user_index = $($(this).find('p')[1]).text()
    post_url = $(this).attr('action')
    $.ajax({
      url: post_url,
      type: 'POST',
      data: { user_id: user_index, job_id: job_index }  
    }).done(function() {
      current.find('input[value="Save to Favorites!"]').css('background', 'rgb(25, 131, 23)');
      current.find('input[value="Save to Favorites!"]').val('Sent to Favorites!');
    });
  });

  $('body').on('submit', '.removefavform', function(e) {
    e.preventDefault();
    current = $(this)
    job_index = $($(this).find('p')[0]).text()
    user_index = $($(this).find('p')[1]).text()
    delete_url = $(this).attr('action')
    $.ajax({
      url: delete_url,
      type: 'DELETE',
      data: { user_id: user_index, job_id: job_index } 
    }).done(function() {
      current.parents('.job-company').fadeOut()
    });
  });

});
