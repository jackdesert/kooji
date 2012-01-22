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
  $("#show_editable").click(function(){
    $("#show_editable").css("display", "none")
    $("#hide_editable").css("display", "block")
    $("#registration_edit").css("display", "block");
    $("#registration_new").css("display", "block");
    $("#registration_show").css("display", "none");
  });

  $("#hide_editable").click(function(){
    $("#hide_editable").css("display", "none")
    $("#show_editable").css("display", "block")
    $("#registration_edit").css("display", "none");
    $("#registration_new").css("display", "none");
    $("#registration_show").css("display", "block");
  });
  
  $("#save_new_registrar").click(function(){
    $(this).hide();
    var get_id = document.getElementById('event_registrar_id');
    var result = get_id.options[get_id.selectedIndex].text;
    alert(result);
    $('<p>New stuff</p>').insertAfter('#event_registrar_id');
  })
  
  $("#event_registrar_id *").click(function(){
    $("#save_new_registrar").show();
  })
});
