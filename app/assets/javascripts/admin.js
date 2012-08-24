// VENDOR

//= require jquery
//= require jquery_ujs
//= require jquery.placeholder
//= require jquery.textile.image

// APP

//= require_tree ./admin
//= require_self

$(function(){
  $(".media").insertTextileImageTo("#post_body");
});

