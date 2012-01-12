// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
  $("#show").click(function(){
    $("#show").css("display", "none")
    $("#hide").css("display", "block")
    $("#registration_form").css("display", "block");
  });

  $("#hide").click(function(){
    $("#hide").css("display", "none")
    $("#show").css("display", "block")
    $("#registration_form").css("display", "none");
  });
});
