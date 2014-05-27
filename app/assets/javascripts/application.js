//= require jquery
//= require jquery_ujs
//= require jquery.tagcanvas
//= require menu

$(document).ready(function(){
    $("#adm-msg").click(function() {
        if ($(".post-adm-comment").css("display") == 'none')
        {
            $(".post-adm-comment").show(300);
        }
        else
        {
            $(".post-adm-comment").hide(300);
        }
    });

  $("#msg-close").click(function() {

    $(".blog-massage-panel").hide(0);
    $(".blog-massage").hide(0);

  });
});

$(document).ready(function(){
  if( ! $('#myCanvas').tagcanvas({
    textColour : '#008DF0',
    outlineColour: '#008DF0',
    weight: true,
    outlineThickness : 1,
    zoom: 0.8,
    maxSpeed : 0.03,
    depth : 0.70,
    textHeight: 14
  }, 'tagcloud'));
});