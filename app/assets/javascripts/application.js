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
  repositionElements();
  $(window).scroll(function(){
    repositionElements();
  });
  
  $("#user_session_email").focus();
  $("#event_event_name").focus();
  $("#user_first_name").focus();

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
    $('#name_of_new_registrar').html("Sending...");
    $('#name_of_new_registrar').show();
    var event_id = $("#event_id").val();
    var url = "/" + event_id + "#update";
    $.post(url,{_method : "put", registrar_id : $("#event_registrar_id").val()}, function(data){
      $('#name_of_new_registrar').html(data);
      setTimeout("$('#name_of_new_registrar').html('')", 5000);
     });
     
    
  })
  
  $("#event_registrar_id *").click(function(){
    $("#save_new_registrar").show();
    $('#name_of_new_registrar').hide();
    
    
  })
});

function repositionElements(){
  var scrollTop = $(window).scrollTop();
  if (scrollTop > 200){
    $('.floating_sidebar').css('position', 'fixed');
    $('.floating_sidebar').css('top', '20px');
  }else{
    $('.floating_sidebar').css('position', 'absolute');
    $('.floating_sidebar').css('top', '220px');
  }
  if (scrollTop > 300){
    $('.floating_event_name').css('position', 'fixed');
    $('.floating_event_name').css('bottom', '-4px');
    $('.floating_event_name').css('top', 'inherit');
    $('.floating_event_name').css('opacity', '0.7');
    $('.floating_event_name').css('z-index', '10');
    
  }else{
    $('.floating_event_name').css('position', 'absolute');
    $('.floating_event_name').css('top', '166px');
    $('.floating_event_name').css('bottom', 'inherit');
    $('.floating_event_name').css('opacity', '1');
  }
}