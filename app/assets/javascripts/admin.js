// VENDOR

//= require jquery
//= require jquery_ujs
//= require jquery.placeholder
//= require jquery.textile.image

// APP

//= require_self

$(function(){
  var toggleLoading = function() { 
    $(".loading").toggle(); 
  }

  $("#media")
    .bind("ajax:loading", toggleLoading)
    .bind("ajax:complete", toggleLoading);

  $(".media").insertTextileImageTo("#post_body");
});

