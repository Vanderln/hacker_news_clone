$(document).ready(function() {
  $('li#display_votes').hide();
  $('form.postvote').submit(function(e){
    e.preventDefault();
    var action = $(this).attr('action');
      // console.log(action);
    
    // var data = $(this).serialize();
    $.post(action, function(response){
      $('li#holder').hide();
      $('li#display_votes').show().append(response + 'Votes');

    
    });
    
  });
});
